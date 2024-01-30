
const cds = require('@sap/cds');

module.exports = cds.service.impl(async function (this: any)
{

    console.log("AssignmentService implementation is initialized");

    this.before('SAVE', 'Assignment', (req: { data: { Beginning: any; Ending: any; }; error: (arg0: number, arg1: string, arg2: string) => void; }) =>
    {
        const { Beginning, Ending } = req.data, today = (new Date).toISOString().slice(0, 10);

        if (!Beginning) req.error(400, "Enter a begin date", "in/Beginning");
        if (!Ending) req.error(400, "Enter an end date", "in/Ending");

        if (Beginning < today) req.error(400, `Begin Date ${Beginning} must not be before today ${today}.`, 'in/Beginning');
        if (Beginning > Ending) req.error(400, `Begin Date ${Beginning} must be before End Date ${Ending}.`, 'in/Beginning');
    });

});
