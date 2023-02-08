# Phase 3 Active Record Mock Code Challenge: Freebie Tracker

## Learning Goals

- Write Active Record Migrations
- Connect between tables using Active Record Associations
- Write class and instance methods using Active Record
- Use Active Record to query the database

## Introduction

For this assignment, we'll be working with a freebie domain.

As developers, when you attend hackathons, you'll realize they hand out a lot of
free items (informally called _freebies_, or swag)! Let's make an app for
developers that keeps track of all the freebies they obtain.

We have three models: `Company`, `Dev`, and `Freebie`

For our purposes, a `Company` has many `Freebie`s, a `Dev` has many `Freebie`s,
and a `Freebie` belongs to a `Dev` and to a `Company`.

`Company` - `Dev` is a many to many relationship.

**Note**: You should draw your domain on paper or on a whiteboard _before you
start coding_. Remember to identify a single source of truth for your data.

## Instructions

To get started, run `bundle install` while inside of this directory.

Build out all of the methods listed in the deliverables. The methods are listed
in a suggested order, but you can feel free to tackle the ones you think are
easiest. Be careful: some of the later methods rely on earlier ones.

**Remember!** This code challenge does not have tests. You cannot run `rspec`
and you cannot run `learn test`. You'll need to create your own sample instances
so that you can try out your code on your own. Make sure your associations and
methods work in the console before submitting.

We've provided you with a tool that you can use to test your code. To use it,
run `rake console` from the command line. This will start a `pry` session with
your classes defined. You can test out the methods that you write here. You are
also encouraged to use the `seeds.rb` file to create sample data to test your
models and associations.

Writing error-free code is more important than completing all of the
deliverables listed - prioritize writing methods that work over writing more
methods that don't work. You should test your code in the console as you write.

Similarly, messy code that works is better than clean code that doesn't. First,
prioritize getting things working. Then, if there is time at the end, refactor
your code to adhere to best practices.

**Before you submit!** Save and run your code to verify that it works as you
expect. If you have any methods that are not working yet, feel free to leave
comments describing your progress.

## What You Already Have

The starter code has migrations and models for the initial `Company` and `Dev`
models, and seed data for some `Company`s and `Dev`s. The schema currently looks
like this:

### companies Table

| Column        | Type    |
| ------------- | ------- |
| name          | String  |
| founding_year | Integer |

### devs Table

| Column | Type   |
| ------ | ------ |
| name   | String |

You will need to create the migration for the `freebies` table using the
attributes specified in the deliverables below.

## Deliverables

Write the following methods in the classes in the files provided. Feel free to
build out any helper methods if needed.

Deliverables use the notation `#` for instance methods, and `.` for class
methods.

Remember: Active Record give your classes access to a lot of methods already!
Keep in mind what methods Active Record gives you access to on each of your
classes when you're approaching the deliverables below.

### Migrations

Before working on the rest of the deliverables, you will need to create a
migration for the `freebies` table.

- A `Freebie` belongs to a `Dev`, and a `Freebie` also belongs to a `Company`.
  In your migration, create any columns your `freebies` table will need to
  establish these relationships using the right foreign keys.
- The `freebies` table should also have:
  - An `item_name` column that stores a string.
  - A `value` column that stores an integer.

After creating the `freebies` table using a migration, use the `seeds.rb` file to
create instances of your `Freebie` class so you can test your code.

**Once you've set up your `freebies` table**, work on building out the following
deliverables.

### Object Association Methods

Use Active Record association macros and Active Record query methods where
appropriate (i.e. `has_many`, `has_many through`, and `belongs_to`).

**Note**: The plural of "freebie" is "freebies" and the singular of "freebies"
is "freebie".

#### Freebie

- `Freebie#dev`
  - returns the `Dev` instance for this Freebie
- `Freebie#company`
  - returns the `Company` instance for this Freebie

#### Company

- `Company#freebies`
  - returns a collection of all the freebies for the Company
- `Company#devs`
  - returns a collection of all the devs who collected freebies from the Company

#### Dev

- `Dev#freebies`
  - returns a collection of all the freebies that the Dev has collected
- `Dev#companies`
  - returns a collection of all the companies that the Dev has collected
    freebies from

Use `rake console` and check that these methods work before proceeding. For
example, you should be able to call `Dev.first.companies` and see a list of the
companies for the first dev in the database based on your seed data; and
`Freebie.first.dev` should return the dev for the first freebie in the database.

### Aggregate and Association Methods

#### Freebie

- `Freebie#print_details`
  - should `puts` to the terminal a string formatted as follows:
    `{insert dev's name} owns a {insert freebie's item_name} from {insert company's name}`

#### Company

- `Company#give_freebie(dev, item_name, value)`
  - takes a `dev` (an instance of the `Dev` class), an `item_name` (string), and a `value` (integer)
    as arguments, and creates a new `Freebie` in the database associated with this
    company and the dev
- `Company#print_all_freebie_details`
  - should `puts` to the terminal a string representing each of the freebie's details for this company
  - each of the freebie's details should be formatted as follows: `{insert dev's name} owns a {insert freebie's item_name} from {insert company's name}`
- `Company#average_freebie_value`
  - returns a `float` representing the average value for all freebies for this company

#### Dev

- `Dev#highest_freebie_value`
  - returns the freebie instance that has the highest value from this dev
- `Dev#remove_freebies(company)`
  - takes a `Company` (an instance of the `Company` class) and removes _all_ of this dev's freebies for that company
  - you will have to delete any rows from the `freebies` table associated with this dev and the company