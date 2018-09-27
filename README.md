# Submit a Ticket Test Coverage
# General
The purpose of this repo is to present a test coverage for a support ticket web page using Selenium Webdriver under the Behave Framework (BDD)

Behavior-driven development (or BDD) is an agile software development technique that encourages collaboration between developers, 
QA and non-technical or business participants in a software project

For more info on Behave please look at the following link: https://behave.readthedocs.io/en/latest/

Selenium WebDriver is a collection of language specific bindings to drive a browser, more info in: https://www.seleniumhq.org/

# Prerequisites

In order to execute the test scripts you need:

- Python2 (https://www.python.org/downloads/release/python-2715/)
- Behave (https://behave.readthedocs.io/en/latest/index.html)
- Selenium (https://www.seleniumhq.org/download/)

"pip install" can be used to install the packages

Web browser driver chromedriver (chrome) is included in this repo

# How to execute the scripts
After cloning the repo execute the command "behave"

If more information is needed, use: "behave --no-capture --no-capture-stderr -f plain"

# Description of the problem and Requirements

The form requires that contact info must be given before accepting the details of a customer's issue, to avoid having bots giving us junk input. 
Once personal information is given and successfully validated, the customer can then provide a Brief description of their issue as well as a long form message.

Contact info includes the customer's name, email address, company name, and a phone number.

Of note:

Customer confidentiality is key to Jive, so this page should always load in HTTPS. If requested via unencrypted HTTP, it should redirect to HTTPS.
Jive has customers in French Canada, and therefore the name input must be able to accommodate names which include apostrophes, dashes, or accented characters
Email addresses must contain an @ character, and must use a top-level domain of at least two characters.
Phone numbers are numeric only
The color of text should always have a contrast of 4.5:1 with its background.
We can't accept inputs for name, email, company name, or issue subject which exceed 80 characters
Whenever an input fails to validate, there should be a visual indicator of which field(s) failed to validate.
 
Do not assume that the form works perfectly as it exists now - feel free to write meaningful tests which would currently fail.

# Test Suite Description

There are three test suites included in this repo:

1) Valid and redirection: Includes test cases related to input valid values and to verify the https redirection requirement
2) Invalid fields: Includes test cases related to test the different fields constrains described in the requirements
3) Empty fields: Includes negative test cases when all or some of the fields are empty

Valid and Redirection scenarios:
- All valid values in the form
- HTTP Redirect to HTTPS
 
Invalid fields scenarios:
- Long string value for name
- Invalid value for email (no @)
- Invalid value for email (invalid domain)
- Long string value for company name
- Mix of number an letters for contact number
- Long string value for subject of issue
- Long value for email address
- Long value for contact number
- Only numbers for name field

Empty Fields scenarios:
- All empty values in the form
- Some empty values in the form
- Some empty values and invalid values in the form
- Empty values in contact info (name, email, company and phone number)
 
For more details about the test procedure and validation please take a look at the feature file for every suite.
For complete Test Results, please take a look at the login_page_test_results spreadsheet

# Issues
During the execution of the test cases I found 2 problems:

1) Email addresses with a top level domain less than two characters are allowed.
2) Phone number field accepts letters and not just numerical values.

# Suggestions about the support form

- When the form is submitted with valid values there is no confirmation or indication that the report was submitted, there is only a redirection to another page. I think some kind of confirmation should be sent to the user to be certain that the support team received the report
- According to the description of the problem, contact info must be filled to send a valid report to prevent reports from bots, however this is not effective since bots can automatically fill the form with the required fields, a captcha method will be more effective to prevent this
- I think is a good idea to add a button to include attachments and to add the fields "Product" and "Version"

# Some details about the implementation

- The scripts were tested using Chrome and Windows 10 

