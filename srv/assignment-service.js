"use strict";
var __awaiter = (this && this.__awaiter) || function (thisArg, _arguments, P, generator) {
    function adopt(value) { return value instanceof P ? value : new P(function (resolve) { resolve(value); }); }
    return new (P || (P = Promise))(function (resolve, reject) {
        function fulfilled(value) { try { step(generator.next(value)); } catch (e) { reject(e); } }
        function rejected(value) { try { step(generator["throw"](value)); } catch (e) { reject(e); } }
        function step(result) { result.done ? resolve(result.value) : adopt(result.value).then(fulfilled, rejected); }
        step((generator = generator.apply(thisArg, _arguments || [])).next());
    });
};
const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {
    return __awaiter(this, void 0, void 0, function* () {
        // Already assignment today?
        // Find out name of day (not on weekend)
        /* this.on('READ', 'Assignment', async() => {
            this.dayOfWeek = dayName(this.Date);
        }) */
        // Validating beginning and ending time (8 - 12:15 and beginning before ending)
        this.before('SAVE', 'Assignment', (req) => {
            const { Beginning, Ending, Day } = req.data, today = (new Date()).toISOString().slice(0, 10);
            if (!Beginning)
                req.error(400, "Enter a begin time", "in/Beginning");
            if (!Ending)
                req.error(400, "Enter an end time", "in/Ending");
            if (Beginning > Ending)
                req.error(400, `Begin Time ${Beginning} must be before end time ${Ending}.`, 'in/Beginning');
            if (Day < today)
                req.error(400, `Begin Date ${Day} must not be before today ${today}.`, 'in/Beginning');
        });
    });
});
