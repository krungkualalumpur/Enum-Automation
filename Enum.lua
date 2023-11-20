--!strict
--services
--packages
--modules
--types
export type CustomEnum <N> = {
	Name : N,
	GetEnumItems : (self : CustomEnum<N>) -> {[number] : CustomEnumItem<CustomEnum<N>, string>}
}

export type CustomEnumItem <E, N> = {
	Name : string,
	Value : number,
	EnumType : E
}
type LapTypeEnum = CustomEnum<"LapType">
export type LapType = CustomEnumItem<LapTypeEnum, string>

type RaceTypeEnum = CustomEnum<"RaceType">
export type RaceType = CustomEnumItem<RaceTypeEnum, string>

type LapVisualTypeEnum = CustomEnum<"LapVisualType">
export type LapVisualType = CustomEnumItem<LapVisualTypeEnum, string>

type CheckpointVisualTypeEnum = CustomEnum<"CheckpointVisualType">
export type CheckpointVisualType = CustomEnumItem<CheckpointVisualTypeEnum, string>

export type CustomEnums = {

	LapType : 	{		
		Linear : CustomEnumItem <LapTypeEnum, "Linear">,
		Loop : CustomEnumItem <LapTypeEnum, "Loop">,
	} & LapTypeEnum,

	RaceType : 	{		
		Freeroam : CustomEnumItem <RaceTypeEnum, "Freeroam">,
		Constraint : CustomEnumItem <RaceTypeEnum, "Constraint">,
	} & RaceTypeEnum,

	LapVisualType : 	{		
		Type1 : CustomEnumItem <LapVisualTypeEnum, "Type1">,
		Type2 : CustomEnumItem <LapVisualTypeEnum, "Type2">,
	} & LapVisualTypeEnum,

	CheckpointVisualType : 	{		
		Type1 : CustomEnumItem <CheckpointVisualTypeEnum, "Type1">,
		Type2 : CustomEnumItem <CheckpointVisualTypeEnum, "Type2">,
	} & CheckpointVisualTypeEnum,

}
--constants
--remotes
--local function


local LapType = {
	Name = "LapType" :: any,
	GetEnumItems = function(self)
		local t = {}
		for _,v in pairs(self) do
			if type(v) == "table" then 
				 table.insert(t, v)  
			end
		end
		return t
	end,
}

LapType.Linear = {
	Name = "Linear" :: any,
	Value = 1,
	EnumType = LapType
}

LapType.Loop = {
	Name = "Loop" :: any,
	Value = 2,
	EnumType = LapType
}

local RaceType = {
	Name = "RaceType" :: any,
	GetEnumItems = function(self)
		local t = {}
		for _,v in pairs(self) do
			if type(v) == "table" then 
				 table.insert(t, v)  
			end
		end
		return t
	end,
}

RaceType.Freeroam = {
	Name = "Freeroam" :: any,
	Value = 1,
	EnumType = RaceType
}

RaceType.Constraint = {
	Name = "Constraint" :: any,
	Value = 2,
	EnumType = RaceType
}

local LapVisualType = {
	Name = "LapVisualType" :: any,
	GetEnumItems = function(self)
		local t = {}
		for _,v in pairs(self) do
			if type(v) == "table" then 
				 table.insert(t, v)  
			end
		end
		return t
	end,
}

LapVisualType.Type1 = {
	Name = "Type1" :: any,
	Value = 1,
	EnumType = LapVisualType
}

LapVisualType.Type2 = {
	Name = "Type2" :: any,
	Value = 2,
	EnumType = LapVisualType
}

local CheckpointVisualType = {
	Name = "CheckpointVisualType" :: any,
	GetEnumItems = function(self)
		local t = {}
		for _,v in pairs(self) do
			if type(v) == "table" then 
				 table.insert(t, v)  
			end
		end
		return t
	end,
}

CheckpointVisualType.Type1 = {
	Name = "Type1" :: any,
	Value = 1,
	EnumType = CheckpointVisualType
}

CheckpointVisualType.Type2 = {
	Name = "Type2" :: any,
	Value = 2,
	EnumType = CheckpointVisualType
}

local CustomEnum = {	
	LapType = LapType :: any,
	RaceType = RaceType :: any,
	LapVisualType = LapVisualType :: any,
	CheckpointVisualType = CheckpointVisualType :: any,
} :: CustomEnums

return CustomEnum