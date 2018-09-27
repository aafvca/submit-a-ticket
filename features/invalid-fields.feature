Feature: Invalid Fields
        Validate the different fields in the form:
        Name, email, Company Name, Phone number Subject of Issue and Message
        Name should include French characters
        email should include @ and a top level domain of at least 2 characters
        Phone number is only numeric
        Any contact info and the subject of issue can not exceed 80 characters

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

Scenario: Long string value for name
          The field cuts any value exceeding 80 characters, then no error should be received

  Given Opening the Submit a Ticket web page
  When  Enter "bad_name" value in "Name"
    And Enter "good_email" value in "Email"
    And Enter "good_company_name" value in "Company Name"
    And Enter "good_phone" value in "Best Contact Number"
    And Enter "good_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And No errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And No errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received

Scenario: Invalid value for email (no @)

  Given Opening the Submit a Ticket web page
  When  Enter "good_name" value in "Name"
    And Enter "bad_email1" value in "Email"
    And Enter "good_company_name" value in "Company Name"
    And Enter "good_phone" value in "Best Contact Number"
    And Enter "good_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And Errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And No errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received

Scenario: Invalid value for email (invalid domain)

  Given Opening the Submit a Ticket web page
  When  Enter "french_name" value in "Name"
    And Enter "bad_email2" value in "Email"
    And Enter "good_company_name" value in "Company Name"
    And Enter "good_phone" value in "Best Contact Number"
    And Enter "good_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And Errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And No errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received

Scenario: Long string value for company name
          The field cuts any value exceeding 80 characters, then no error should be received

  Given Opening the Submit a Ticket web page
  When  Enter "good_name" value in "Name"
    And Enter "good_email" value in "Email"
    And Enter "bad_company_name" value in "Company Name"
    And Enter "good_phone" value in "Best Contact Number"
    And Enter "good_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And No errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And No errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received

Scenario: Mix of number an letters for contact number
          Contact Number should allow numeric values only

  Given Opening the Submit a Ticket web page
  When  Enter "good_name" value in "Name"
    And Enter "good_email" value in "Email"
    And Enter "bad_company_name" value in "Company Name"
    And Enter "bad_phone" value in "Best Contact Number"
    And Enter "good_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And No errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And Errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received

Scenario: Long string value for subject of issue
          The field cuts any value exceeding 80 characters, then no error should be received

  Given Opening the Submit a Ticket web page
  When  Enter "french_name" value in "Name"
    And Enter "good_email" value in "Email"
    And Enter "good_company_name" value in "Company Name"
    And Enter "good_phone" value in "Best Contact Number"
    And Enter "bad_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And No errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And No errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received

Scenario: Long value for email address
          The field cuts any value exceeding 80 characters, then no error should be received

  Given Opening the Submit a Ticket web page
  When  Enter "french_name" value in "Name"
    And Enter "long_email" value in "Email"
    And Enter "good_company_name" value in "Company Name"
    And Enter "good_phone" value in "Best Contact Number"
    And Enter "bad_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And Errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And No errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received

Scenario: Long value for contact number
          The field cuts any value exceeding 80 characters, then no error should be received

  Given Opening the Submit a Ticket web page
  When  Enter "french_name" value in "Name"
    And Enter "good_email" value in "Email"
    And Enter "good_company_name" value in "Company Name"
    And Enter "long_phone" value in "Best Contact Number"
    And Enter "bad_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And No errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And No errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received

Scenario: Only numbers for name field
          Contact number is limited to numerical values,

  Given Opening the Submit a Ticket web page
  When  Enter "long_phone" value in "Name"
    And Enter "good_email" value in "Email"
    And Enter "good_company_name" value in "Company Name"
    And Enter "good_phone" value in "Best Contact Number"
    And Enter "good_subject" value in "Subject of Issue"
    And Enter "message" value in "Message"
  Then Click in "Submit Ticket" button
    And No errors in "Name" field should be received
    And No errors in "Email" field should be received
    And No errors in "Company Name" field should be received
    And No errors in "Best Contact Number" field should be received
    And No errors in "Subject of Issue" field should be received
    And No errors in "Message" field should be received