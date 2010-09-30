Feature: user interacts with a polymorphic web app

  In order to increase brand value but minimize costs, the business owner wants
  his products to appear to have websites of their own.

  Each product has a unique domain name associated with it. In the background,
  a single web application morphs into different kinds of websites depending on
  the domain name used to access it.
  
  If the web app is accessed using a domain name associated with a product, then
  it will behave as the website of that particular product.

  Scenario Outline: user accesses the application through different domain names
    Given the following products exist:
      | name  | price | domain    |
      | Foo   |   0.0 | free.dev  |
      | Bar   |  10.0 | paid.dev  |
      | Lorem |   0.0 | lorem.dev |
      | Ipsum |  67.0 | ipsum.dev |
    And the domain name for the prospecting system is "sytem.dev"
    When I visit "<url>"
    Then I must see "<expected outcome>"

    Scenarios: the domain name is associated with a free product
      | url           | expected outcome                           |
      | www.free.dev  | an opt-in page for the product named Foo   |
      | www.lorem.dev | an opt-in page for the product named Lorem |

    Scenarios: the domain name is associated with a paid product
      | url           | expected outcome                         |
      | www.paid.dev  | a sales page for the product named Bar   |
      | www.ipsum.dev | a sales page for the product named Ipsum |

    Scenarios: the domain name is associated with the prospecting system
      | url            | expected outcome |
      | www.system.dev | the login page   |
