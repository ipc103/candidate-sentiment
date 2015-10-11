# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

candidates = {
  "Hillary Clinton" => "HillaryClinton",
  "Donald Trump" => "realDonaldTrump",
  "Bernie Sanders" => "BernieSanders",
  "Martin O'Malley" => "GovernorOMalley",
  "Jeb Bush" => "JebBush",
  "Ben Carson" => "RealBenCarson",
  "Chris Christie" => "GovChristie",
  "Carly Fiorina" => "CarlyFiorina",
  "Ted Cruz" => "TedCruz",
  "Mike Huckabee" => "GovMikeHuckabee",
  "John Kasich" => "JohnKasich",
  "Marco Rubio" => "MarcoRubio",
}

candidates.each { |name, twitter| Candidate.find_or_create_by(name: name, twitter: twitter)}
