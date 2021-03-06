{-# LANGUAGE DeriveGeneric #-}

module DataTypes.Subjects where

import Data.Aeson
import GHC.Generics

newtype Author = Author {name :: String}
  deriving (Eq, Generic)

instance ToJSON Author where
  toEncoding = genericToEncoding defaultOptions

instance FromJSON Author

instance Show Author where
  show (Author name) = name

data BookSubjectsResponse = BookSubjectsResponse
  { title :: String,
    subject :: [String],
    authors :: [Author]
  }
  deriving (Eq, Generic)

instance ToJSON BookSubjectsResponse where
  toEncoding = genericToEncoding defaultOptions

instance FromJSON BookSubjectsResponse

instance Show BookSubjectsResponse where
  show (BookSubjectsResponse title _ authors) =
    "Title: "
      ++ title
      ++ "\n\
         \Authors: "
      ++ show authors

newtype SubjectsResponse = SubjectsResponse {works :: [BookSubjectsResponse]}
  deriving (Eq, Generic)

instance ToJSON SubjectsResponse where
  toEncoding = genericToEncoding defaultOptions

instance FromJSON SubjectsResponse

subjects :: [String]
subjects =
  [ "Arts",
    "Architecture",
    "Art Instruction",
    "Art History",
    "Dance",
    "Design",
    "Fashion",
    "Film",
    "Graphic Design",
    "Music",
    "Music Theory",
    "Painting",
    "Photography",
    "Animals",
    "Bears",
    "Cats",
    "Kittens",
    "Dogs",
    "Puppies",
    "Fiction",
    "Fantasy",
    "Historical Fiction",
    "Horror",
    "Humor",
    "Literature",
    "Magic",
    "Mystery and detective stories",
    "Plays",
    "Poetry",
    "Romance",
    "Science Fiction",
    "Short Stories",
    "Thriller",
    "Young Adult",
    "Science & Mathematics",
    "Biology",
    "Chemistry",
    "Mathematics",
    "Physics",
    "Programming",
    "Business & Finance",
    "Management",
    "Entrepreneurship",
    "Business Economics",
    "Business Success",
    "Finance",
    "Children's",
    "Kids Books",
    "Stories in Rhyme",
    "Baby Books",
    "Bedtime Books",
    "Picture Books",
    "History",
    "Ancient Civilization",
    "Archaeology",
    "Anthropology",
    "World War II",
    "Social Life and Customs",
    "Health & Wellness",
    "Cooking",
    "Cookbooks",
    "Mental Health",
    "Exercise",
    "Nutrition",
    "Self-help",
    "Biography",
    "Autobiographies",
    "History",
    "Politics and Government",
    "World War II",
    "Women",
    "Kings and Rulers",
    "Composers",
    "Artists",
    "Social Sciences",
    "Anthropology",
    "Religion",
    "Political Science",
    "Psychology",
    "Places",
    "Brazil",
    "India",
    "Indonesia",
    "United States",
    "Textbooks",
    "History",
    "Mathematics",
    "Geography",
    "Psychology",
    "Algebra",
    "Education",
    "Business & Economics",
    "Science",
    "Chemistry",
    "English Language",
    "Physics",
    "Computer Science",
    "Other"
  ]
