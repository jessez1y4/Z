# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

ItemCategoryType.destroy_all
ItemCategory.destroy_all

t1 = ItemCategoryType.create name: 'clothing'
t2 = ItemCategoryType.create name: 'shoes'
t3 = ItemCategoryType.create name: 'accessories'


ItemCategory.create name: 'blazer', item_category_type_id: t1.id
ItemCategory.create name: 'cardigan', item_category_type_id: t1.id
ItemCategory.create name: 'dress', item_category_type_id: t1.id
ItemCategory.create name: 'intimate', item_category_type_id: t1.id
ItemCategory.create name: 'jeans', item_category_type_id: t1.id
ItemCategory.create name: 'one-piece', item_category_type_id: t1.id
ItemCategory.create name: 'outerwear', item_category_type_id: t1.id
ItemCategory.create name: 'pants', item_category_type_id: t1.id
ItemCategory.create name: 'shirt', item_category_type_id: t1.id
ItemCategory.create name: 'shorts', item_category_type_id: t1.id
ItemCategory.create name: 'skirt', item_category_type_id: t1.id
ItemCategory.create name: 'suit', item_category_type_id: t1.id
ItemCategory.create name: 'sweater', item_category_type_id: t1.id
ItemCategory.create name: 'swim', item_category_type_id: t1.id
ItemCategory.create name: 'top', item_category_type_id: t1.id
ItemCategory.create name: 'vest', item_category_type_id: t1.id
ItemCategory.create name: 'boots', item_category_type_id: t2.id
ItemCategory.create name: 'dress shoes', item_category_type_id: t2.id
ItemCategory.create name: 'flats', item_category_type_id: t2.id
ItemCategory.create name: 'heels & wedges', item_category_type_id: t2.id
ItemCategory.create name: 'sandals', item_category_type_id: t2.id
ItemCategory.create name: 'sneakers', item_category_type_id: t2.id
ItemCategory.create name: 'bag', item_category_type_id: t3.id
ItemCategory.create name: 'belt', item_category_type_id: t3.id
ItemCategory.create name: 'cufflink', item_category_type_id: t3.id
ItemCategory.create name: 'eyewear', item_category_type_id: t3.id
ItemCategory.create name: 'gloves', item_category_type_id: t3.id
ItemCategory.create name: 'hair', item_category_type_id: t3.id
ItemCategory.create name: 'hat', item_category_type_id: t3.id
ItemCategory.create name: 'jewelry', item_category_type_id: t3.id
ItemCategory.create name: 'legwear', item_category_type_id: t3.id
ItemCategory.create name: 'make-up', item_category_type_id: t3.id
ItemCategory.create name: 'scarf', item_category_type_id: t3.id
ItemCategory.create name: 'suspender', item_category_type_id: t3.id
ItemCategory.create name: 'tie', item_category_type_id: t3.id
ItemCategory.create name: 'umbrella', item_category_type_id: t3.id
ItemCategory.create name: 'wallet', item_category_type_id: t3.id
ItemCategory.create name: 'watch', item_category_type_id: t3.id

# tags
Tag.destroy_all('category > 0')

Tag.create name: 'PARTY', category: 1
Tag.create name: 'VACATION', category: 1
Tag.create name: 'DATING', category: 1
Tag.create name: 'SPORTY', category: 1
Tag.create name: 'HOME', category: 1
Tag.create name: 'OFFICE', category: 1
Tag.create name: 'CAMPUS', category: 1
Tag.create name: 'STREET', category: 1
Tag.create name: 'BEACH', category: 1
Tag.create name: 'DINNER', category: 1
Tag.create name: 'NIGHT OUT', category: 1
Tag.create name: 'TRAVEL', category: 1
Tag.create name: 'COSPLAY', category: 1

Tag.create name: 'VINTAGE', category: 2
Tag.create name: 'URBAN', category: 2
Tag.create name: 'BF', category: 2
Tag.create name: 'MIX & MATCH', category: 2
Tag.create name: 'ASIA', category: 2
Tag.create name: 'AMERICA', category: 2
Tag.create name: 'LATINO', category: 2
Tag.create name: 'CLASSIC', category: 2
Tag.create name: 'TRADITIONAL', category: 2
Tag.create name: 'OL', category: 2
Tag.create name: 'FRESH', category: 2
Tag.create name: 'NEUTRAL', category: 2
Tag.create name: 'HIP-HOP', category: 2
Tag.create name: 'PUNK', category: 2
Tag.create name: 'SWEET', category: 2
Tag.create name: 'COUNTRY', category: 2
Tag.create name: 'ROCK', category: 2
Tag.create name: 'LOLITA', category: 2

Tag.create name: 'STRIPE', category: 3
Tag.create name: 'CARTOON', category: 3
Tag.create name: 'FURS', category: 3

Tag.create name: 'New York', category: 5
Tag.create name: 'Los Angeles', category: 5
Tag.create name: 'Chicago', category: 5
Tag.create name: 'Houston', category: 5
Tag.create name: 'Philadelphia', category: 5
Tag.create name: 'Phoenix', category: 5
Tag.create name: 'San Diego', category: 5
Tag.create name: 'San Antonio', category: 5
Tag.create name: 'Dallas', category: 5
Tag.create name: 'Detroit', category: 5
Tag.create name: 'San Jose', category: 5
Tag.create name: 'Indianapolis', category: 5
Tag.create name: 'San Francisco', category: 5
Tag.create name: 'Columbus', category: 5
Tag.create name: 'Austin', category: 5
Tag.create name: 'Memphis', category: 5
Tag.create name: 'Baltimore', category: 5
Tag.create name: 'Charlotte', category: 5
Tag.create name: 'Boston', category: 5
Tag.create name: 'Milwaukee', category: 5
Tag.create name: 'Washington D.C', category: 5
Tag.create name: 'Seattle', category: 5
Tag.create name: 'Washington', category: 5
Tag.create name: 'Denver', category: 5
Tag.create name: 'Las Vegas', category: 5
Tag.create name: 'Portland', category: 5
Tag.create name: 'Oklahoma City', category: 5
Tag.create name: 'Atlanta', category: 5
Tag.create name: 'Kansas City', category: 5
Tag.create name: 'New Orleans', category: 5
Tag.create name: 'Cleveland', category: 5
Tag.create name: 'Omaha', category: 5
Tag.create name: 'Colorado Springs', category: 5
Tag.create name: 'Oakland', category: 5
Tag.create name: 'Miami', category: 5
Tag.create name: 'Minneapolis', category: 5
Tag.create name: 'Honolulu', category: 5
Tag.create name: 'St. Louis', category: 5
Tag.create name: 'Cincinnati', category: 5
Tag.create name: 'Tampa', category: 5
Tag.create name: 'Pittsburgh', category: 5
Tag.create name: 'Aurora, Colorado', category: 5
Tag.create name: 'Anchorage', category: 5
Tag.create name: 'Newark', category: 5
Tag.create name: 'Jersey City', category: 5
Tag.create name: 'Orlando', category: 5
Tag.create name: 'Reno', category: 5
Tag.create name: 'vancouver', category: 5
Tag.create name: 'Toronto', category: 5
Tag.create name: 'Moscow', category: 5
Tag.create name: 'London', category: 5
Tag.create name: 'Berlin', category: 5
Tag.create name: 'Madrid', category: 5
Tag.create name: 'Rome', category: 5
Tag.create name: 'Paris', category: 5
Tag.create name: 'Bucharest', category: 5
Tag.create name: 'Vienna', category: 5
Tag.create name: 'Hamburg', category: 5
Tag.create name: 'Budapest', category: 5
Tag.create name: 'Warsaw', category: 5
Tag.create name: 'Barcelona', category: 5
Tag.create name: 'kiev', category: 5
Tag.create name: 'Milan', category: 5
Tag.create name: 'Munich', category: 5
Tag.create name: 'Prague', category: 5
Tag.create name: 'Sofia', category: 5
Tag.create name: 'Brussels', category: 5
Tag.create name: 'Stockholm', category: 5
Tag.create name: 'Amsterdam', category: 5
Tag.create name: 'Zagreb', category: 5
Tag.create name: 'Riga', category: 5
Tag.create name: 'Athens', category: 5
Tag.create name: 'Helsinki', category: 5
Tag.create name: 'Copenhagen', category: 5
Tag.create name: 'Lisbon', category: 5
Tag.create name: 'Vilnius', category: 5
Tag.create name: 'Dublin', category: 5
Tag.create name: 'Tallinn', category: 5
Tag.create name: 'Bratislava', category: 5
Tag.create name: 'Mexico City', category: 5
Tag.create name: 'Sao Paulo', category: 5
Tag.create name: 'Buenos Aires', category: 5
Tag.create name: 'Río de Janeiro', category: 5
Tag.create name: 'Lima', category: 5
Tag.create name: 'Santiago', category: 5
Tag.create name: 'Caracas', category: 5
Tag.create name: 'Montevideo', category: 5
Tag.create name: 'Port-au-Prince', category: 5
Tag.create name: 'La Paz', category: 5
Tag.create name: 'San Juan', category: 5
Tag.create name: 'Tokyo', category: 5
Tag.create name: 'Seoul', category: 5
Tag.create name: 'Shanghai', category: 5
Tag.create name: 'Beijing', category: 5
Tag.create name: 'GuangZhou', category: 5
Tag.create name: 'Hongkong', category: 5
Tag.create name: 'Jakarta', category: 5
Tag.create name: 'Manila', category: 5
Tag.create name: 'Singapore', category: 5
Tag.create name: 'Mumbai', category: 5
Tag.create name: 'Osaka', category: 5
Tag.create name: 'Shenzhen', category: 5
Tag.create name: 'HangZhou', category: 5
Tag.create name: 'ChengDu', category: 5
Tag.create name: 'Taipei', category: 5
Tag.create name: 'Bangkok', category: 5
Tag.create name: 'Ho Chi Minh City', category: 5
Tag.create name: 'Syndey', category: 5
Tag.create name: 'Melbourne', category: 5
Tag.create name: 'Wellington', category: 5
Tag.create name: 'Auckland', category: 5


Tag.create name: 'Harvard University', category: 4
Tag.create name: 'Stanford University', category: 4
Tag.create name: 'University of California Berkeley', category: 4
Tag.create name: 'Massachusetts Institute of Technology', category: 4
Tag.create name: 'University of Cambridge', category: 4
Tag.create name: 'California Institute of Technology', category: 4
Tag.create name: 'Princeton University', category: 4
Tag.create name: 'Columbia University', category: 4
Tag.create name: 'University of Chicago', category: 4
Tag.create name: 'University of Oxford', category: 4
Tag.create name: 'Yale University', category: 4
Tag.create name: 'University of California Los Angeles', category: 4
Tag.create name: 'Cornell University', category: 4
Tag.create name: 'University of California San Diego', category: 4
Tag.create name: 'University of Pennsylvania', category: 4
Tag.create name: 'University of Washington', category: 4
Tag.create name: 'The Johns Hopkins University', category: 4
Tag.create name: 'University of California San Francisco', category: 4
Tag.create name: 'University of Wisconsin Madison', category: 4
Tag.create name: 'Swiss Federal Institute of Technology Zurich', category: 4
Tag.create name: 'The University of Tokyo', category: 4
Tag.create name: 'University College London', category: 4
Tag.create name: 'University of Michigan Ann Arbor', category: 4
Tag.create name: 'The Imperial College of Science Technology and Medicine', category: 4
Tag.create name: 'University of Illinois at Urbana Champaign', category: 4
Tag.create name: 'Kyoto University', category: 4
Tag.create name: 'New York University', category: 4
Tag.create name: 'University of Toronto', category: 4
Tag.create name: 'University of Minnesota Twin Cities', category: 4
Tag.create name: 'Northwestern University', category: 4
Tag.create name: 'Duke University', category: 4
Tag.create name: 'Washington University in St Louis', category: 4
Tag.create name: 'University of Colorado at Boulder', category: 4
Tag.create name: 'Rockefeller University', category: 4
Tag.create name: 'University of California Santa Barbara', category: 4
Tag.create name: 'The University of Texas at Austin', category: 4
Tag.create name: 'Pierre and Marie Curie University Paris', category: 4
Tag.create name: 'University of Maryland College Park', category: 4
Tag.create name: 'University of Paris Sud', category: 4
Tag.create name: 'University of British Columbia', category: 4
Tag.create name: 'The University of Manchester', category: 4
Tag.create name: 'University of Copenhagen', category: 4
Tag.create name: 'University of North Carolina at Chapel Hill', category: 4
Tag.create name: 'Karolinska Institute', category: 4
Tag.create name: 'University of California Irvine', category: 4
Tag.create name: 'The University of Texas Southwestern Medical Center at Dallas', category: 4
Tag.create name: 'University of California Davis', category: 4
Tag.create name: 'University of Southern California', category: 4
Tag.create name: 'Vanderbilt University', category: 4
Tag.create name: 'Technical University Munich', category: 4
Tag.create name: 'The University of Edinburgh', category: 4
Tag.create name: 'Carnegie Mellon University', category: 4
Tag.create name: 'Utrecht University', category: 4
Tag.create name: 'Pennsylvania State University University Park', category: 4
Tag.create name: 'University of Heidelberg', category: 4
Tag.create name: 'University of Melbourne', category: 4
Tag.create name: 'Purdue University west Lafayette', category: 4
Tag.create name: 'McGill University', category: 4
Tag.create name: 'The Hebrew University of Jerusalem', category: 4
Tag.create name: 'University of Zurich', category: 4
Tag.create name: 'Rutgers The State University of New Jersey', category: 4
Tag.create name: 'University of Munich', category: 4
Tag.create name: 'University of Pittsburgh', category: 4
Tag.create name: 'University of Bristol', category: 4
Tag.create name: 'The Ohio State University Columbus', category: 4
Tag.create name: 'The Australian National University', category: 4
Tag.create name: 'Brown University', category: 4
Tag.create name: "King's College London", category: 4
Tag.create name: 'University of Geneva', category: 4
Tag.create name: 'University of Oslo', category: 4
Tag.create name: 'Ecole Normale Superieure Paris', category: 4
Tag.create name: 'University of Florida', category: 4
Tag.create name: 'Uppsala University', category: 4
Tag.create name: 'Leiden University', category: 4
Tag.create name: 'Boston University', category: 4
Tag.create name: 'University of Helsinki', category: 4
Tag.create name: 'Technion Israel Institute of Technology', category: 4
Tag.create name: 'University of Arizona', category: 4
Tag.create name: 'Arizona State University Tempe', category: 4
Tag.create name: 'Moscow State University', category: 4
Tag.create name: 'Aarhus University', category: 4
Tag.create name: 'Stockholm University', category: 4
Tag.create name: 'University of Basel', category: 4
Tag.create name: 'University of Nottingham', category: 4
Tag.create name: 'Ghent University', category: 4
Tag.create name: 'Indiana University Bloomington', category: 4
Tag.create name: 'Osaka University', category: 4
Tag.create name: 'The University of Queensland', category: 4
Tag.create name: 'University of Utah', category: 4
Tag.create name: 'University of Rochester', category: 4
Tag.create name: 'The University of Western Australia', category: 4
Tag.create name: 'McMaster University', category: 4
Tag.create name: 'Michigan State University', category: 4
Tag.create name: 'Rice University', category: 4
Tag.create name: 'University of Groningen', category: 4
Tag.create name: 'Weizmann Institute of Science', category: 4
Tag.create name: 'University of Strasbourg', category: 4
Tag.create name: 'University of Sydney', category: 4
Tag.create name: 'Case Western Reserve University', category: 4
Tag.create name: 'University of Freiburg', category: 4
Tag.create name: 'Baylor College of Medicine', category: 4
Tag.create name: 'Catholic University of Leuven', category: 4
Tag.create name: 'Catholic University of Louvain', category: 4
Tag.create name: 'Emory University', category: 4
Tag.create name: 'Georgia Institute of Technology', category: 4
Tag.create name: 'Hokkaido University', category: 4
Tag.create name: 'Joseph Fourier University', category: 4
Tag.create name: 'London School of Economics and Political Science', category: 4
Tag.create name: 'Lund University', category: 4
Tag.create name: 'Mayo Medical School', category: 4
Tag.create name: 'Monash University', category: 4
Tag.create name: 'Nagoya University', category: 4
Tag.create name: 'National Taiwan University', category: 4
Tag.create name: 'National University of Singapore', category: 4
Tag.create name: 'Oregon State University', category: 4
Tag.create name: 'Radboud University Nijmegen', category: 4
Tag.create name: 'Seoul National University', category: 4
Tag.create name: 'Swiss Federal Institute of Technology of Lausanne', category: 4
Tag.create name: 'Tel Aviv University', category: 4
Tag.create name: 'Texas A&M University College Station', category: 4
Tag.create name: 'The University of Georgia', category: 4
Tag.create name: 'The University of Sheffield', category: 4
Tag.create name: 'Tohoku University', category: 4
Tag.create name: 'Tokyo Institute of Technology', category: 4
Tag.create name: 'Tufts University', category: 4
Tag.create name: 'University Libre Bruxelles', category: 4
Tag.create name: 'University of Alberta', category: 4
Tag.create name: 'University of Amsterdam', category: 4
Tag.create name: 'University of Birmingham', category: 4
Tag.create name: 'University of Bonn', category: 4
Tag.create name: 'University of California Riverside', category: 4
Tag.create name: 'University of California Santa Cruz', category: 4
Tag.create name: 'University of Frankfurt', category: 4
Tag.create name: 'University of Goettingen', category: 4
Tag.create name: 'University of Iowa', category: 4
Tag.create name: 'University of Liverpool', category: 4
Tag.create name: 'University of Massachusetts Amherst', category: 4
Tag.create name: 'University of Massachusetts Medical School Worcester', category: 4
Tag.create name: 'University of Montreal', category: 4
Tag.create name: 'University of Muenster', category: 4
Tag.create name: 'University of New South Wales', category: 4
Tag.create name: 'University of Paris Diderot', category: 4
Tag.create name: 'University of Pisa', category: 4
Tag.create name: 'University of Roma La Sapienza', category: 4
Tag.create name: 'University of Sao Paulo', category: 4
Tag.create name: 'University of Sussex', category: 4
Tag.create name: 'University of Virginia', category: 4
Tag.create name: 'University of Wageningen', category: 4
Tag.create name: 'VU University Amsterdam', category: 4
Tag.create name: 'Aix Marseille University', category: 4
Tag.create name: 'Cardiff University', category: 4
Tag.create name: 'Colorado State University', category: 4
Tag.create name: 'Dartmouth College', category: 4
Tag.create name: 'Erasmus University', category: 4
Tag.create name: 'Florida State University', category: 4
Tag.create name: 'Fudan University', category: 4
Tag.create name: 'George Mason University', category: 4
Tag.create name: 'Iowa State University', category: 4
Tag.create name: 'King Saud University', category: 4
Tag.create name: 'Kyushu University', category: 4
Tag.create name: 'Mount Sinai School of Medicine', category: 4
Tag.create name: 'National Autonomous University of Mexico', category: 4
Tag.create name: 'North Carolina State University Raleigh', category: 4
Tag.create name: 'Oregon Health and Science University', category: 4
Tag.create name: 'Peking University', category: 4
Tag.create name: 'Shanghai Jiao Tong University', category: 4
Tag.create name: 'State University of New York at Stony Brook', category: 4
Tag.create name: 'Technical University of Denmark', category: 4
Tag.create name: 'The Chinese University of Hong Kong', category: 4
Tag.create name: 'The University of Glasgow', category: 4
Tag.create name: 'The University of Texas Health Science Center at Houston', category: 4
Tag.create name: 'Tsinghua University', category: 4
Tag.create name: 'University of Bern', category: 4
Tag.create name: 'University of Buenos Aires', category: 4
Tag.create name: 'University of Delaware', category: 4
Tag.create name: 'University of Gothenburg', category: 4
Tag.create name: 'University of Hamburg', category: 4
Tag.create name: 'University of Hawaii at Manoa', category: 4
Tag.create name: 'University of Illinois at Chicago', category: 4
Tag.create name: 'University of Kiel', category: 4
Tag.create name: 'University of Koeln', category: 4
Tag.create name: 'University of Leeds', category: 4
Tag.create name: 'University of Mainz', category: 4
Tag.create name: 'University of Maryland Baltimore', category: 4
Tag.create name: 'University of Miami', category: 4
Tag.create name: 'University of Milan', category: 4
Tag.create name: 'University of Padua', category: 4
Tag.create name: 'University of Paris Descartes', category: 4
Tag.create name: 'University of Southampton', category: 4
Tag.create name: 'University of Tennessee Knoxville', category: 4
Tag.create name: 'University of Tsukuba', category: 4
Tag.create name: 'University of Tuebingen', category: 4
Tag.create name: 'University of Vienna', category: 4
Tag.create name: 'University of Warwick', category: 4
Tag.create name: 'University of Waterloo', category: 4
Tag.create name: 'University of Wuerzburg', category: 4
Tag.create name: 'Virginia Commonwealth University', category: 4
Tag.create name: 'Virginia Polytechnic Institute and State University', category: 4
Tag.create name: 'Zhejiang University', category: 4
Tag.create name: 'Autonomous University of Barcelona', category: 4
Tag.create name: 'Autonomous University of Madrid', category: 4
Tag.create name: 'Brandeis University', category: 4
Tag.create name: 'Charles University in Prague', category: 4
Tag.create name: 'Claude Bernard University Lyon', category: 4
Tag.create name: 'Complutense University of Madrid', category: 4
Tag.create name: 'Dalhousie University', category: 4
Tag.create name: 'Delft University of Technology', category: 4
Tag.create name: 'Dresden University of Technology', category: 4
Tag.create name: 'Ecole Normale Superieur Lyon', category: 4
Tag.create name: 'Ecole Polytechnique', category: 4
Tag.create name: 'Karlsruhe Institute of Technology', category: 4
Tag.create name: 'King Abdulaziz University', category: 4
Tag.create name: 'Kobe University', category: 4
Tag.create name: 'Korea Advanced Institute of Science and Technology', category: 4
Tag.create name: 'Laval University', category: 4
Tag.create name: 'Louisiana State University Baton Rouge', category: 4
Tag.create name: 'Macquarie University', category: 4
Tag.create name: 'Medical University of Vienna', category: 4
Tag.create name: 'Nanjing University', category: 4
Tag.create name: 'Nanyang Technological University', category: 4
Tag.create name: 'National Tsing Hua University', category: 4
Tag.create name: 'Newcastle University', category: 4
Tag.create name: 'Norwegian University of Science and Technology', category: 4
Tag.create name: 'Paul Sabatier University', category: 4
Tag.create name: 'Polytechnic Institute of Milan', category: 4
Tag.create name: 'Queen Mary University of London', category: 4
Tag.create name: "Queen's University", category: 4
Tag.create name: 'Rensselaer Polytechnic Institute', category: 4
Tag.create name: 'Royal Institute of Technology', category: 4
Tag.create name: 'RWTH Aachen University', category: 4
Tag.create name: 'Scuola Normale Superiore Pisa', category: 4
Tag.create name: 'Simon Fraser University', category: 4
Tag.create name: 'State University of New York at Buffalo', category: 4
Tag.create name: 'Sun Yat sen University', category: 4
Tag.create name: 'Sungkyunkwan University', category: 4
Tag.create name: 'Swedish University of Agricultural Sciences', category: 4
Tag.create name: 'Technical University of Berlin', category: 4
Tag.create name: 'The George Washington University', category: 4
Tag.create name: 'The Hong Kong University of Science and Technology', category: 4
Tag.create name: 'The University of Adelaide', category: 4
Tag.create name: 'The University of Alabama at Birmingham', category: 4
Tag.create name: 'The University of Auckland', category: 4
Tag.create name: 'The University of Calgary', category: 4
Tag.create name: 'The University of Connecticut Storrs', category: 4
Tag.create name: 'The University of Dundee', category: 4
Tag.create name: 'The University of Hong Kong', category: 4
Tag.create name: 'The University of New Mexico Albuquerque', category: 4
Tag.create name: 'Thomas Jefferson University', category: 4
Tag.create name: 'Trinity College Dublin', category: 4
Tag.create name: 'Umea University', category: 4
Tag.create name: 'University of Aberdeen', category: 4
Tag.create name: 'University of Antwerp', category: 4
Tag.create name: 'University of Barcelona', category: 4
Tag.create name: 'University of Bergen', category: 4
Tag.create name: 'University of Bologna', category: 4
Tag.create name: 'University of Bordeaux', category: 4
Tag.create name: 'University of Cape Town', category: 4
Tag.create name: 'University of Central Florida', category: 4
Tag.create name: 'University of Cincinnati', category: 4
Tag.create name: 'University of Colorado at Denver', category: 4
Tag.create name: 'University of Duesseldorf', category: 4
Tag.create name: 'University of Durham', category: 4
Tag.create name: 'University of East Anglia', category: 4
Tag.create name: 'University of Erlangen Nuremberg', category: 4
Tag.create name: 'University of Exeter', category: 4
Tag.create name: 'University of Florence', category: 4
Tag.create name: 'University of Guelph', category: 4
Tag.create name: 'University of Houston', category: 4
Tag.create name: 'University of Innsbruck', category: 4
Tag.create name: 'University of Kansas Lawrence', category: 4
Tag.create name: 'University of Kentucky', category: 4
Tag.create name: 'University of Lausanne', category: 4
Tag.create name: 'University of Leicester', category: 4
Tag.create name: 'University of Leipzig', category: 4
Tag.create name: 'University of Liege', category: 4
Tag.create name: 'University of Lorraine', category: 4
Tag.create name: 'University of Maastricht', category: 4
Tag.create name: 'University of Marburg', category: 4
Tag.create name: 'University of Medicine and Dentistry New Jersey', category: 4
Tag.create name: 'University of Missouri Columbia', category: 4
Tag.create name: 'University of Montpellier', category: 4
Tag.create name: 'University of Nebraska Lincoln', category: 4
Tag.create name: 'University of Notre Dame', category: 4
Tag.create name: 'University of Oregon', category: 4
Tag.create name: 'University of Otago', category: 4
Tag.create name: 'University of Ottawa', category: 4
Tag.create name: 'University of Paris Dauphine', category: 4
Tag.create name: 'University of Saskatchewan', category: 4
Tag.create name: 'University of Science and Technology of China', category: 4
Tag.create name: 'University of South Florida', category: 4
Tag.create name: 'University of Southern Denmark', category: 4
Tag.create name: 'University of St Andrews', category: 4
Tag.create name: 'University of Stuttgart', category: 4
Tag.create name: 'University of Turin', category: 4
Tag.create name: 'University of York', category: 4
Tag.create name: 'Washington State University Pullman', category: 4
Tag.create name: 'Western University', category: 4
Tag.create name: 'Yeshiva University', category: 4
Tag.create name: 'Yonsei University', category: 4
Tag.create name: 'Aristotle University of Thessaloniki', category: 4
Tag.create name: 'Bar Ilan University', category: 4
Tag.create name: 'Beijing Normal University', category: 4
Tag.create name: 'Ben Gurion University of the Negev', category: 4
Tag.create name: 'Brigham Young University', category: 4
Tag.create name: 'Chalmers University of Technology', category: 4
Tag.create name: 'Chang Gung University', category: 4
Tag.create name: 'China Agricultural University', category: 4
Tag.create name: 'City University of Hong Kong', category: 4
Tag.create name: 'City University of New York City College', category: 4
Tag.create name: 'Clemson University', category: 4
Tag.create name: 'Eindhoven University of Technology', category: 4
Tag.create name: 'Eotvos Lorand University', category: 4
Tag.create name: 'Federal University of Minas Gerais', category: 4
Tag.create name: 'Federal University of Rio de Janeiro', category: 4
Tag.create name: 'Flinders University', category: 4
Tag.create name: 'Georgetown University', category: 4
Tag.create name: 'Griffith University', category: 4
Tag.create name: 'Hanyang University', category: 4
Tag.create name: 'Harbin Institute of Technology', category: 4
Tag.create name: 'Hiroshima University', category: 4
Tag.create name: 'Huazhong University of Science and Technology', category: 4
Tag.create name: 'Indian Institute of Science', category: 4
Tag.create name: 'Industrial Physics and Chemistry Higher Educational Institution Paris', category: 4
Tag.create name: 'Jagiellonian University', category: 4
Tag.create name: 'James Cook University', category: 4
Tag.create name: 'Jilin University', category: 4
Tag.create name: 'Kansas State University', category: 4
Tag.create name: 'Keio University', category: 4
Tag.create name: 'King Fahd University of Petroleum & Minerals', category: 4
Tag.create name: 'Korea University', category: 4
Tag.create name: 'Lancaster University', category: 4
Tag.create name: 'Linkoping University', category: 4
Tag.create name: 'Medical University of South Carolina', category: 4
Tag.create name: 'National and Kapodistrian University of Athens', category: 4
Tag.create name: 'National Cheng Kung University', category: 4
Tag.create name: 'National Chiao Tung University', category: 4
Tag.create name: 'Northeastern University', category: 4
Tag.create name: 'Okayama University', category: 4
Tag.create name: 'Pohang University of Science and Technology', category: 4
Tag.create name: 'Polytechnic University of Valencia', category: 4
Tag.create name: "Queen's University Belfast", category: 4
Tag.create name: 'Saint Louis University', category: 4
Tag.create name: 'Saint Petersburg State University', category: 4
Tag.create name: 'San Diego State University', category: 4
Tag.create name: 'Sao Paulo State University', category: 4
Tag.create name: 'Shandong University', category: 4
Tag.create name: 'Sichuan University', category: 4
Tag.create name: 'State University of Campinas', category: 4
Tag.create name: 'State University of New York at Albany', category: 4
Tag.create name: 'State University of New York Health Science Center at Brooklyn', category: 4
Tag.create name: 'Swinburne University of Technology', category: 4
Tag.create name: 'Syracuse University', category: 4
Tag.create name: 'Technical University Darmstadt', category: 4
Tag.create name: 'Temple University', category: 4
Tag.create name: 'The Hong Kong Polytechnic University', category: 4
Tag.create name: 'The University of Montana Missoula', category: 4
Tag.create name: 'The University of Reading', category: 4
Tag.create name: 'The University of Texas at Dallas', category: 4
Tag.create name: 'The University of Texas Health Science Center at San Antonio', category: 4
Tag.create name: 'Tokyo Medical and Dental University', category: 4
Tag.create name: 'Tulane University', category: 4
Tag.create name: 'University College Cork', category: 4
Tag.create name: 'University College Dublin', category: 4
Tag.create name: 'University of Bath', category: 4
Tag.create name: 'University of Belgrade', category: 4
Tag.create name: 'University of Bochum', category: 4
Tag.create name: 'University of Genova', category: 4
Tag.create name: 'University of Giessen', category: 4
Tag.create name: 'University of Granada', category: 4
Tag.create name: 'University of Halle Wittenberg', category: 4
Tag.create name: 'University of Konstanz', category: 4
Tag.create name: 'University of Lisbon', category: 4
Tag.create name: 'University of Manitoba', category: 4
Tag.create name: 'University of Naples Federico II', category: 4
Tag.create name: 'University of Newcastle', category: 4
Tag.create name: 'University of Nice Sophia Antipolis', category: 4
Tag.create name: 'University of Oklahoma Norman', category: 4
Tag.create name: 'University of Oulu', category: 4
Tag.create name: 'University of Perugia', category: 4
Tag.create name: 'University of Pompeu Fabra', category: 4
Tag.create name: 'University of Porto', category: 4
Tag.create name: 'University of Regensburg', category: 4
Tag.create name: 'University of Rhode Island', category: 4
Tag.create name: 'University of South Carolina Columbia', category: 4
Tag.create name: 'University of Tasmania', category: 4
Tag.create name: 'University of the Witwatersrand', category: 4
Tag.create name: 'University of Turku', category: 4
Tag.create name: 'University of Twente', category: 4
Tag.create name: 'University of Ulm', category: 4
Tag.create name: 'University of Valencia', category: 4
Tag.create name: 'University of Vermont', category: 4
Tag.create name: 'University of Victoria', category: 4
Tag.create name: 'University of Warsaw', category: 4
Tag.create name: 'University of Wollongong', category: 4
Tag.create name: 'Vrije University Brussel', category: 4
Tag.create name: 'Wake Forest University', category: 4
Tag.create name: 'Waseda University', category: 4
Tag.create name: 'Wayne State University', category: 4
Tag.create name: 'Xian Jiao Tong University', category: 4
Tag.create name: 'Auburn University', category: 4
Tag.create name: 'Beihang University', category: 4
Tag.create name: 'Boston College', category: 4
Tag.create name: 'Cairo University', category: 4
Tag.create name: 'Carleton University', category: 4
Tag.create name: 'Catholic University of Chile', category: 4
Tag.create name: 'Catholic University of Korea', category: 4
Tag.create name: 'Catholic University of the Sacred Heart', category: 4
Tag.create name: 'Central South University', category: 4
Tag.create name: 'China Medical University', category: 4
Tag.create name: 'Concordia University', category: 4
Tag.create name: 'Curtin University of Technology', category: 4
Tag.create name: 'Dalian University of Technology', category: 4
Tag.create name: 'Drexel University', category: 4
Tag.create name: 'Ecole National Superieure Mines Paris', category: 4
Tag.create name: 'Federal University of Rio Grande do Sul', category: 4
Tag.create name: 'Hannover Medical School', category: 4
Tag.create name: 'Indiana University Purdue University at Indianapolis', category: 4
Tag.create name: 'Istanbul University', category: 4
Tag.create name: 'Kanazawa University', category: 4
Tag.create name: 'Kent State University', category: 4
Tag.create name: 'King Abdullah University of Science and Technology', category: 4
Tag.create name: 'Kyung Hee University', category: 4
Tag.create name: 'Kyungpook National University', category: 4
Tag.create name: 'La Trobe University', category: 4
Tag.create name: 'Lanzhou University', category: 4
Tag.create name: 'Lehigh University', category: 4
Tag.create name: 'London School of Hygiene and Tropical Medicine', category: 4
Tag.create name: 'Massey University', category: 4
Tag.create name: 'Medical College of Wisconsin', category: 4
Tag.create name: 'Medical University of Graz', category: 4
Tag.create name: 'Medical University of Innsbruck', category: 4
Tag.create name: 'Nagasaki University', category: 4
Tag.create name: 'Nankai University', category: 4
Tag.create name: 'National Central University', category: 4
Tag.create name: 'National Sun Yat Sen University', category: 4
Tag.create name: 'National Yang Ming University', category: 4
Tag.create name: 'Niigata University', category: 4
Tag.create name: 'Osaka City University', category: 4
Tag.create name: 'Peking Union Medical College', category: 4
Tag.create name: 'Polytechnic University of Turin', category: 4
Tag.create name: 'Pusan National University', category: 4
Tag.create name: 'South China University of Technology', category: 4
Tag.create name: 'Southeast University', category: 4
Tag.create name: 'Southern Methodist University', category: 4
Tag.create name: 'Stockholm School of Economics', category: 4
Tag.create name: 'Technical University of Braunschweig', category: 4
Tag.create name: 'Technical University of Lisbon', category: 4
Tag.create name: 'Texas Tech University', category: 4
Tag.create name: 'The Open University', category: 4
Tag.create name: 'The University of Texas Medical Branch at Galveston', category: 4
Tag.create name: 'The University of Tokushima', category: 4
Tag.create name: 'Tianjin University', category: 4
Tag.create name: 'Tongji University', category: 4
Tag.create name: 'University of Alaska Fairbanks', category: 4
Tag.create name: 'University of Arkansas at Fayetteville', category: 4
Tag.create name: 'University of Bayreuth', category: 4
Tag.create name: 'University of Bielefeld', category: 4
Tag.create name: 'University of Bremen', category: 4
Tag.create name: 'University of Canterbury', category: 4
Tag.create name: 'University of Chile', category: 4
Tag.create name: 'University of Coimbra', category: 4
Tag.create name: 'University of Duisburg Essen', category: 4
Tag.create name: 'University of Eastern Finland', category: 4
Tag.create name: 'University of Essex', category: 4
Tag.create name: 'University of Ferrara', category: 4
Tag.create name: 'University of Graz', category: 4
Tag.create name: 'University of Haifa', category: 4
Tag.create name: 'University of Hannover', category: 4
Tag.create name: 'University of Idaho', category: 4
Tag.create name: 'University of Jena', category: 4
Tag.create name: 'University of Jyvaskyla', category: 4
Tag.create name: 'University of KwaZulu Natal', category: 4
Tag.create name: 'University of Ljubljana', category: 4
Tag.create name: 'University of Malaya', category: 4
Tag.create name: 'University of Maryland Baltimore County', category: 4
Tag.create name: 'University of Milan Bicocca', category: 4
Tag.create name: 'University of Nebraska Medical Center', category: 4
Tag.create name: 'University of New Hampshire Durham', category: 4
Tag.create name: 'University of Palermo', category: 4
Tag.create name: 'University of Pavia', category: 4
Tag.create name: 'University of Quebec', category: 4
Tag.create name: 'University of Rennes', category: 4
Tag.create name: 'University of Roma Tor Vergata', category: 4
Tag.create name: 'University of Sherbrooke', category: 4
Tag.create name: 'University of Surrey', category: 4
Tag.create name: 'University of Szeged', category: 4
Tag.create name: 'University of Technology Sydney', category: 4
Tag.create name: 'University of Tehran', category: 4
Tag.create name: 'University of the Basque Country', category: 4
Tag.create name: 'University of Tromso', category: 4
Tag.create name: 'University of Wyoming', category: 4
Tag.create name: 'University of Zagreb', category: 4
Tag.create name: 'University of Zaragoza', category: 4
Tag.create name: 'Utah State University', category: 4
Tag.create name: 'Victoria University of Wellington', category: 4
Tag.create name: 'Vienna University of Technology', category: 4
Tag.create name: 'Wuhan University', category: 4
Tag.create name: 'Xiamen University', category: 4
Tag.create name: 'York University', category: 4
