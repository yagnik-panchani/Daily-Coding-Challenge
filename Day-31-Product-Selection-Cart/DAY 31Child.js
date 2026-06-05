import { LightningElement, api } from 'lwc';

export default class Child extends LightningElement {

    @api display = [];

    @api count = 0;

    get hasProducts() {

        return this.display.length > 0;
    }
}
