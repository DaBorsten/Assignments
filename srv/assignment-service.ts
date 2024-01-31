
const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (this: any)
{

    // Already assignment today?



    // Find out name of day (not on weekend)

    /* this.on('READ', 'Assignment', async() => {
        this.dayOfWeek = dayName(this.Date);
    }) */


    // Validating beginning and ending time (8 - 12:15 and beginning before ending)

    this.before('SAVE', 'Assignment', (req: { data: { Beginning: any; Ending: any; Day: any; }; error: (arg0: number, arg1: string, arg2: string) => void; }) =>
    {
        const { Beginning, Ending, Day } = req.data, today = (new Date()).toISOString().slice(0, 10);

        if (!Beginning) req.error(400, "Enter a begin time", "in/Beginning");
        if (!Ending) req.error(400, "Enter an end time", "in/Ending");


        if (Beginning > Ending) req.error(400, `Begin Time ${Beginning} must be before end time ${Ending}.`, 'in/Beginning');


        if (Day < today) req.error(400, `Begin Date ${Day} must not be before today ${today}.`, 'in/Beginning');
    });

});
