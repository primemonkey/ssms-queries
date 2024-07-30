CREATE INDEX idx_person_gender ON Person(Gender);
CREATE INDEX idx_person_mother ON Person(MotherID);
CREATE INDEX idx_person_father ON Person(FatherID);
CREATE INDEX idx_person_spouse ON Person(SpouseID);

CREATE INDEX idx_employment_person ON Employment(PersonID);
CREATE INDEX idx_employment_enterprise ON Employment(EnterpriseID);
CREATE INDEX idx_employment_contracttype ON Employment(ContractType);

CREATE INDEX idx_enterprise_president ON Enterprise(PresidentID);
