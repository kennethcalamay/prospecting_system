Feature: prospect opts in

  In order to increase the probability of a potential customer buying from me
  As an affiliate
  I want to capture a prospect's contact information
  So that I can follow up and build relationship with them

  Scenario Outline: prospect opts in
    Given I am on the opt-in page
    When I opt-in with "<firstname>", "<email>", and "<phone>"
    Then I should see "<notice>"

    Scenarios: valid information
      | firstname | email         | phone       | notice                    |
      | Kenneth   | e@mail.com    | 09278433149 | verify your email address |
      | Kenneth   | e@mail.com    |             | verify your email address |

    Scenarios: valid first names
      | firstname  | email        | phone       | notice                    |
      | Jose Ma.   | e@mail.com   | 09278433149 | verify your email address |
      | Ma. Fe     | e@mail.com   | 09278433149 | verify your email address |
      | JC         | e@mail.com   | 09278433149 | verify your email address |
      | John Kevin | e@mail.com   | 09278433149 | verify your email address |

    Scenarios: valid email addresses
      | firstname  | email        | phone       | notice                    |
      | Kenneth    | k_c@mail.com | 09278433149 | verify your email address |
      | Kenneth    | k+c@mail.com | 09278433149 | verify your email address |
      | Kenneth    | k.c@mail.com | 09278433149 | verify your email address |
      | Kenneth    | kc7@mail.com | 09278433149 | verify your email address |

    Scenarios: Invalid first names
      | firstname  | email        | phone       | notice                    |
      | 007007     | e@mail.com   | 09278433149 | firstname is invalid      |
      | ken007     | e@mail.com   | 09278433149 | firstname is invalid      |
      | 007ken     | e@mail.com   | 09278433149 | firstname is invalid      |
      |            | e@mail.com   | 09278433149 | firstname can't be blank  |

    Scenarios: Invalid email addresses
      | firstname  | email        | phone       | notice                    |
      | Kenneth    | 0k7@mail.com | 09278433149 | email is invalid          |
      | Kenneth    | 007@mail.com | 09278433149 | email is invalid          |
      | Kenneth    |              | 09278433149 | email can't be blank      |
