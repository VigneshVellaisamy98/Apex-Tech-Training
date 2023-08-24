// Import necessary modules from the LWC library
import { LightningElement, track } from 'lwc';

// Declare the Calculator class that extends LightningElement
export default class Calculator extends LightningElement {
    // Decorate the displayValue property with the track decorator
    @track displayValue = '';

    // Method that handles button clicks
    handleButtonClick(event) {
        // Get the clicked button's value from the event
        let clickedValue = event.target.value;

        // Arrays of operators and special buttons
        let operators = ['+', '-', '*', '/'];
        let specialButtons = ['=', 'AC'];

        // Check if the clicked button is a special button
        if (specialButtons.includes(clickedValue)) {
            // Call handleSpecialButtonClick method for special buttons
            this.handleSpecialButtonClick(clickedValue);
        }
        // Check if the clicked button is an operator
        else if (operators.includes(clickedValue)) {
            // Call handleOperatorClick method for operators
            this.handleOperatorClick(clickedValue);
        }
        // If the clicked button is a number
        else {
            // Append the clicked number to displayValue
            this.displayValue += clickedValue;
        }
    }

    // Method to handle special button clicks
    handleSpecialButtonClick(buttonValue) {
        // Check if the button is '=', then call calculateResult method
        if (buttonValue === '=') {
            this.calculateResult();
        }
        // Check if the button is 'AC', then call clearDisplay method
        else if (buttonValue === 'AC') {
            this.clearDisplay();
        }
    }

    // Method to handle operator button clicks
    handleOperatorClick(operator) {
        // Append the operator to the displayValue
        this.displayValue += operator;
    }

    // Method to calculate and display the result
    calculateResult() {
        // Create a Promise to handle the result calculation
        new Promise((resolve, reject) => {
            // Try to evaluate the displayValue expression
            try {
                resolve(eval(this.displayValue)); // Resolve with the result
            } catch (error) {
                reject('Error'); // Reject with an error message
            }
        })
        .then(result => {
            // Update displayValue with the result
            this.displayValue = result;
        })
        .catch(error => {
            // Display 'Error' if an error occurred
            this.displayValue = error;
        });
    }

    // Method to clear the displayValue
    clearDisplay() {
        this.displayValue = ''; // Reset displayValue to an empty string
    }
}
