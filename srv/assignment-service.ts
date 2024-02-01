import { time } from "console";

const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (this: any)
{

    // Get Assignment
    const { Assignment } = this.entities;

    // Validating beginning and ending time (8 - 12:15 and beginning before ending)

    this.before('SAVE', 'Assignment', async (req: {
        data: {
            ID: any; Class_ID: any; Day: any; Beginning: any; Ending: any;
        }; error: (arg0: number, arg1: string, arg2: string) => void;
    }) =>
    {

        const { ID, Class_ID, Day, Beginning, Ending } = req.data, today = (new Date()).toISOString().slice(0, 10);


        //**********************************************
        //              Time Validation
        //**********************************************

        // Beginning has to be before ending
        if (Beginning > Ending)
        {
            req.error(400, `Begin Time ${Beginning} must be before end time ${Ending}.`, 'in/Beginning');
            req.error(400, `Ending Time ${Ending} must be after beginning time ${Beginning}.`, 'in/Ending');
        }

        // Beginning has to be 8:00:00 or greater
        if (Date.parse(Day + "T" + Beginning) < Date.parse(Day + "T08:00:00")) req.error(400, `Begin time ${Beginning} must be 8:00:00 or after.`, 'in/Beginning');

        // Ending has to be 12:15:00 or less
        if (Date.parse(Day + "T" + Ending) > Date.parse(Day + "T12:15:00")) req.error(400, `End time ${Beginning} must be 12:15:00 or before.`, 'in/Ending');

        // If Day == today, then check beginning time
        if ((Day == today) && (Date.parse(Day + "T" + Beginning) < Date.parse(new Date().toISOString())))
        {
            let now = new Date();

            if (Date.parse(new Date().toISOString()) >= Date.parse(Day + "T12:15:00"))
            {
                req.error(400, `No assignments for today.`, 'in/Day');
            } else
            {
                req.error(400, `Begin time ${Beginning} must be ${now.getHours()}:${now.getMinutes()}:${now.getSeconds()} or after.`, 'in/Beginning');
            }
        }


        //**********************************************
        //              Day Validation
        //**********************************************

        // Day not before today
        if (Day < today) req.error(400, `Begin Date ${Day} must be today ${today} or after.`, 'in/Day');

        // Not on weekend
        if (new Date(Date.parse(Day)).getDay() == 0 || new Date(Date.parse(Day)).getDay() == 6)
        {
            req.error(400, `There are no assignments allowed on weekend. Please change the Day.`, 'in/Day');
        }


        //**********************************************
        //       Already Assignments on this day?
        //**********************************************

        // Count assignment of a class on a day
        const result = await this
            .read(Assignment)
            .where({ 'Class_ID': Class_ID, 'Day': Day });

        const numberOfAssociationsWithClass = result.length;

        // If there is at least 1 assignment check if its the current one (updating)
        if (numberOfAssociationsWithClass > 0)
        {

            let existing = false;

            for (let i = 0; i < numberOfAssociationsWithClass; i++)
            {
                if (result[i].ID == req.data.ID)
                {
                    existing = true;
                }
            }

            if (existing == false)
            {
                req.error(400, `There is already an assignment this day ${Day}.`, 'in/Day');
            }

        }

    });

});
