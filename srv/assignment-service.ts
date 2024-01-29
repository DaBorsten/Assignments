/* 
const cds = require('@sap/cds');

module.exports = cds.service.impl(async function ()
{
    this.BEFORE('SAVE', 'Assignment', assignmentsData =>
    {
        const assignments = Array.isArray(assignmentsData) ? assignmentsData : [assignmentsData];
        assignments.forEach(assignment =>
        {
            if (assignment.Beginning > assignment.Ending)
            {
                console.log("Erfolgreich");
            } else
            {
                console.log("Nicht erfolgreich");
            }
        });
    });
}); */