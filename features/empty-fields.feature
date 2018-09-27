Feature: Empty Fields
        Validate errors when fields are empty and form is submitted

Background:
  Given Submit a ticket form is "https://jive.com/resources/support/submit-a-ticket"
    And Set basic contact info as "<variable_name>" and "<value>" below
    |variable_name    | value                                                                               |
    |good_name        | John Doe                                                                            |
    |bad_name         | ThisisaverylongstringtomakethetctofailThisisaverylongstringtomakethetctofailenough23|
    |french_name      | Benoît Eugène Anaïs Zoé Laëtitia                                                    |
    |good_email       | stomv@live.com                                                                      |
    |bad_email1       | idontthink.thisisavalidemail                                                        |
    |bad_email2       | kobayasi@mobile.c                                                                   |
    |long_email       | kobayasi@abcdefghijklmnopqrstuuvxyzabcdefghijklmnopqrstuuvxyzabcdefghijklmnopqrs.com|
    |good_company_name| logmein                                                                             |
    |bad_company_name | ThisisaverylongstringtomakethetctofailThisisaverylongstringtomakethetctofailenough23|
    |good_phone       | +1 514 123 4567                                                                     |
    |bad_phone        | +1 abc def ghij                                                                     |
    |long_phone       | 123456789012345678901234567890123456789012345678901234567890123456789012345678901234|
    |good_subject     | This is a Test, please ignore                                                       |
    |bad_subject      | ThisisaverylongstringtomakethetctofailThisisaverylongstringtomakethetctofailenough23|
    |message          | This is a test message, please ignore, thanks                                       |

Scenario: All empty values in the form
  Given Opening the Submit a Ticket web page
  When Empty value in "Name"
    And Empty value in "Email"
    And Empty value in "Company Name"
    And Empty value in "Best Contact Number"
    And Empty value in "Subject of Issue"
    And Empty value in "Message"
  Then Click in "Submit Ticket" button
    And Errors in "Name" field should be received
    And Errors in "Email" field should be received
    And Errors in "Company Name" field should be received
    And Errors in "Best Contact Number" field should be received
    And Errors in "Subject of Issue" field should be received
    And Errors in "Message" field should be received

Scenario: Some empty values in the form

  Given Opening the Submit a Ticket web page
  When  Enter "good_name" value in "Name"
    And Empty value in "Email"
    And Enter "good_company_name" value in "Company Name"
    And Empty value in "Best Contact Number"
    And Enter "good_subject" value in "Subject of Issue"
    And Empty value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And Errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And Errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And Errors in "Message" field should be received

Scenario: Some empty values and invalid values in the form
          This TC covers all the different invalid values: empty, long and invalid.
          Long values don't return an error since the field is limited to 80 characters

  Given Opening the Submit a Ticket web page
  When  Empty value in "Name"
    And Enter "bad_email2" value in "Email"
    And Empty value in "Company Name"
    And Enter "bad_phone" value in "Best Contact Number"
    And Enter "bad_subject" value in "Subject of Issue"
    And Empty value in "Message"
  Then Click in "Submit Ticket" button
    And Errors in "Name" field should be received
    And Errors in "Email" field should be received
    And Errors in "Company Name" field should be received
    And Errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And Errors in "Message" field should be received

Scenario: Empty values in contact info (name, email, company and phone number)

  Given Opening the Submit a Ticket web page
  When  Empty value in "Name"
    And Empty value in "Email"
    And Empty value in "Company Name"
    And Empty value in "Best Contact Number"
    And Enter "good_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And Errors in "Name" field should be received
    And Errors in "Email" field should be received
    And Errors in "Company Name" field should be received
    And Errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received