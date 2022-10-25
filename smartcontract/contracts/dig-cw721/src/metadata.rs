use schemars::JsonSchema;
use serde::{Deserialize, Serialize};

#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug, Default)]
pub struct Trait {
    pub display_type: Option<String>,
    pub trait_type: String,
    pub value: String,
}

#[derive(Serialize, Deserialize, Clone, Debug, PartialEq, JsonSchema)]
pub struct Coordinate {
    pub lat: String,
    pub lon: String,
}

// Specification for Dig project 

// see: https://docs.opensea.io/docs/metadata-standards
#[derive(Serialize, Deserialize, Clone, PartialEq, JsonSchema, Debug, Default)]
pub struct Metadata {
    pub name: Option<String>,
    pub image: Option<String>,
    pub description: Option<String>,
    pub coordinate: Option<Coordinate>,
    pub land_area: Option<String>,
    pub construction_area: Option<String>,
    pub image_gallary: Option<Vec<String>>,
    pub attributes: Option<Vec<Trait>>,
}

