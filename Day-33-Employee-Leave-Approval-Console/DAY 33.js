import { LightningElement } from 'lwc';

import getEmployees
from '@salesforce/apex/EmployeeController.getEmployees';

import approveLeave
from '@salesforce/apex/EmployeeController.approveLeave';

import rejectLeave
from '@salesforce/apex/EmployeeController.rejectLeave';

export default class LeaveApprovalConsole
extends LightningElement {

    employees = [];

    showModal = false;

    selectedEmployeeId;

    managerComment = '';

    connectedCallback() {

        this.loadEmployees();
    }

    loadEmployees() {

        getEmployees()
        .then(result => {

            this.employees = result;
        });
    }

    handleRowAction(event) {

        const actionName =
            event.detail.action.name;

        const row =
            event.detail.row;

        if(actionName === 'approve') {

            approveLeave({
                employeeId: row.Id
            })
            .then(() => {

                this.loadEmployees();
            });
        }

        if(actionName === 'reject') {

            this.selectedEmployeeId =
                row.Id;

            this.showModal = true;
        }
    }

    handleComment(event) {

        this.managerComment =
            event.target.value;
    }

    closeModal() {

        this.showModal = false;
    }

    submitReject() {

        rejectLeave({

            employeeId:
            this.selectedEmployeeId,

            comment:
            this.managerComment

        })
        .then(() => {

            this.showModal = false;

            this.loadEmployees();
        });
    }
}
