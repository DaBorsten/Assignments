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
Object.defineProperty(exports, "__esModule", { value: true });
const cds = require('@sap/cds');
module.exports = cds.service.impl(function () {
    return __awaiter(this, void 0, void 0, function* () {
        // Get Assignment
        const { Assignment } = this.entities;
        // Validating beginning and ending time (8 - 12:15 and beginning before ending)
        this.before('SAVE', 'Assignment', (req) => __awaiter(this, void 0, void 0, function* () {
            const { ID, Class_ID, Day, Beginning, Ending } = req.data, today = (new Date()).toISOString().slice(0, 10);
            if (!Beginning)
                req.error(400, "Enter a begin time", "in/Beginning");
            if (!Ending)
                req.error(400, "Enter an end time", "in/Ending");
            if (!Day)
                req.error(400, "Enter a day", "in/Day");
            //**********************************************
            //              Time Validation
            //**********************************************
            // Beginning has to be before ending
            if (Beginning > Ending) {
                req.error(400, `Begin Time ${Beginning} must be before end time ${Ending}.`, 'in/Beginning');
                req.error(400, `Ending Time ${Ending} must be after beginning time ${Beginning}.`, 'in/Ending');
            }
            // Beginning has to be 8:00:00 or greater
            if (Date.parse(Day + "T" + Beginning) < Date.parse(Day + "T08:00:00"))
                req.error(400, `Begin time ${Beginning} must be 8:00:00 or after.`, 'in/Beginning');
            // Ending has to be 12:15:00 or less
            if (Date.parse(Day + "T" + Ending) > Date.parse(Day + "T12:15:00"))
                req.error(400, `End time ${Beginning} must be 12:15:00 or before.`, 'in/Ending');
            // If Day == today, then check beginning time
            if ((Day == today) && (Date.parse(Day + "T" + Beginning) < Date.parse(new Date().toISOString()))) {
                let now = new Date();
                console.log(`Aktuell: ${Date.parse(new Date().toISOString())}`);
                console.log(`12:15: ${Date.parse(Day + "T12:15:00")}`);
                if (Date.parse(new Date().toISOString()) >= Date.parse(Day + "T12:15:00")) {
                    req.error(400, `No assignments for today.`, 'in/Day');
                }
                else {
                    req.error(400, `Begin time ${Beginning} must be ${now.getHours()}:${now.getMinutes()}:${now.getSeconds()} or after.`, 'in/Beginning');
                }
            }
            //**********************************************
            //              Day Validation
            //**********************************************
            // Day not before today
            if (Day < today)
                req.error(400, `Begin Date ${Day} must be today ${today} or after.`, 'in/Day');
            // Not on weekend
            if (new Date(Date.parse(Day)).getDay() == 0 || new Date(Date.parse(Day)).getDay() == 6) {
                req.error(400, `There are no assignments allowed on weekend. Please change the Day.`, 'in/Day');
            }
            //**********************************************
            //       Already Assignments on this day?
            //**********************************************
            // Count assignment of a class on a day
            const result = yield this
                .read(Assignment)
                .where({ 'Class_ID': Class_ID, 'Day': Day });
            const numberOfAssociationsWithClass = result.length;
            // If there is at least 1 assignment check if its the current one (updating)
            if (numberOfAssociationsWithClass > 0) {
                let existing = false;
                for (let i = 0; i < numberOfAssociationsWithClass; i++) {
                    if (result[i].ID == req.data.ID) {
                        existing = true;
                    }
                }
                if (existing == false) {
                    req.error(400, `There is already an assignment this day ${Day}.`, 'in/Day');
                }
            }
        }));
    });
});
