require( "ui.uieditor.widgets.BackgroundFrames.GenericMenuFrame" )
require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelectButtons" )
require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelectItem_gadget1" )
require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelectItem_gadget2" )
require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelectItem_gadget3" )
require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelectItem_gadget4" )
require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelectItem_major1" )
require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelectItem_major2" )
require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationItemSelectTintButtons" )
require( "ui.uieditor.widgets.MP.EscalationSelect.EscalationSelectInventoryList" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectionItem_gadget1" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectionItem_gadget2" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectionItem_gadget3" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectionItem_gadget4" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectionItem_major1" )
require( "ui.uieditor.widgets.MP.PositionsLoadout.positionLoadoutsSelectionItem_major2" )

local PostLoadFunc = function ( self, controller )
	local f1_local0 = self
	local f1_local1 = self.subscribeToModel
	local f1_local2 = Engine.GetModelForController( controller )
	f1_local1( f1_local0, f1_local2:create( "PositionDraft.stage" ), function ( model )
		local stage = Engine.GetModelValue( model )
		if stage == 5 then
			GoBack( self, controller )
		end
	end )
end

LUI.createMenu.EscalationItemSelect = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "EscalationItemSelect" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	DataSourceHelperRecreate( controller, "PositionEditLoadout" )
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( 0, 1, 0, 0 )
	self:setTopBottom( 0, 1, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "EscalationItemSelect.buttonPrompts" )
	self.anyChildUsesUpdateState = true
	
	local glowbuttons = CoD.EscalationItemSelectButtons.new( self, controller )
	glowbuttons:mergeStateConditions( {
		{
			stateName = "Top",
			condition = function ( menu, element, event )
				return IsFreeCursorOnTopOfScreen( controller )
			end
		},
		{
			stateName = "Bottom",
			condition = function ( menu, element, event )
				return not IsFreeCursorOnTopOfScreen( controller )
			end
		}
	} )
	glowbuttons:subscribeToModel( Engine.GetModel( DataSources.FreeCursor.getModel( controller ), "position" ), function ( model )
		self:updateElementState( glowbuttons, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "position"
		} )
	end )
	glowbuttons:setLeftRight( 0, 0, 0, 1920 )
	glowbuttons:setTopBottom( 0, 0, 0, 1080 )
	glowbuttons:setZoom( 20 )
	self:addElement( glowbuttons )
	self.glowbuttons = glowbuttons
	
	local GenericMenuFrame0 = CoD.GenericMenuFrame.new( self, controller )
	GenericMenuFrame0:setLeftRight( 0, 1, 0, 0 )
	GenericMenuFrame0:setTopBottom( 0, 1, 0, 0 )
	GenericMenuFrame0:setAlpha( 0 )
	GenericMenuFrame0:setZoom( 20 )
	GenericMenuFrame0.titleLabel:setText( Engine.Localize( "" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.Label0:setText( Engine.Localize( "" ) )
	GenericMenuFrame0.cac3dTitleIntermediary0.FE3dTitleContainer0.MenuTitle.TextBox1.FeatureIcon.FeatureIcon:setImage( RegisterImage( "uie_t7_mp_icon_header_character" ) )
	self:addElement( GenericMenuFrame0 )
	self.GenericMenuFrame0 = GenericMenuFrame0
	
	local Image = LUI.UIImage.new()
	Image:setLeftRight( 0, 0, 0, 1920 )
	Image:setTopBottom( 0, 0, 540, 544 )
	Image:setRGB( 0.55, 0.56, 0.56 )
	Image:setAlpha( 0 )
	Image:setZoom( 20 )
	self:addElement( Image )
	self.Image = Image
	
	local wheelBacking = LUI.UIImage.new()
	wheelBacking:setLeftRight( 0, 0, 168, 768 )
	wheelBacking:setTopBottom( 0, 0, 293, 845 )
	wheelBacking:setAlpha( 0.7 )
	wheelBacking:setZoom( 20 )
	wheelBacking:setScale( 0.95 )
	wheelBacking:setImage( RegisterImage( "uie_menu_loadout_wheel_backing" ) )
	self:addElement( wheelBacking )
	self.wheelBacking = wheelBacking
	
	local UnlocksTextBox = LUI.UIText.new()
	UnlocksTextBox:setLeftRight( 0, 0, 369, 569 )
	UnlocksTextBox:setTopBottom( 0, 0, 291, 321 )
	UnlocksTextBox:setRGB( 0.19, 0.62, 0.57 )
	UnlocksTextBox:setAlpha( 0.8 )
	UnlocksTextBox:setZoom( 20 )
	UnlocksTextBox:setText( Engine.Localize( "MPUI_UNLOCKS_CAPS" ) )
	UnlocksTextBox:setTTF( "fonts/UnitedSansSmCdLt_0.ttf" )
	UnlocksTextBox:setLetterSpacing( 3 )
	UnlocksTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	UnlocksTextBox:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( UnlocksTextBox )
	self.UnlocksTextBox = UnlocksTextBox
	
	local major1b = CoD.EscalationItemSelectItem_major2.new( self, controller )
	major1b:setLeftRight( 0, 0, 280, 420 )
	major1b:setTopBottom( 0, 0, 375, 495 )
	major1b:setZoom( 20 )
	major1b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		major1b:setModel( model, controller )
	end )
	major1b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.major1", function ( model )
		major1b.EscalationItemSelectedmajor2:setModel( model, controller )
	end )
	self:addElement( major1b )
	self.major1b = major1b
	
	local major1 = CoD.positionLoadoutsSelectionItem_major2.new( self, controller )
	major1:setLeftRight( 0, 0, 280, 420 )
	major1:setTopBottom( 0, 0, 375, 495 )
	major1:setAlpha( 0 )
	major1:setZoom( 20 )
	major1:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		major1:setModel( model, controller )
	end )
	major1:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.major1", function ( model )
		major1.selectedItem:setModel( model, controller )
	end )
	self:addElement( major1 )
	self.major1 = major1
	
	local major2b = CoD.EscalationItemSelectItem_major1.new( self, controller )
	major2b:setLeftRight( 0, 0, 524, 664 )
	major2b:setTopBottom( 0, 0, 376, 496 )
	major2b:setZoom( 20 )
	major2b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		major2b:setModel( model, controller )
	end )
	major2b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.major2", function ( model )
		major2b.EscalationItemSelectedmajor1:setModel( model, controller )
	end )
	self:addElement( major2b )
	self.major2b = major2b
	
	local major2 = CoD.positionLoadoutsSelectionItem_major1.new( self, controller )
	major2:setLeftRight( 0, 0, 524, 664 )
	major2:setTopBottom( 0, 0, 376, 496 )
	major2:setAlpha( 0 )
	major2:setZoom( 20 )
	major2:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		major2:setModel( model, controller )
	end )
	major2:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.major2", function ( model )
		major2.selectedItem:setModel( model, controller )
	end )
	self:addElement( major2 )
	self.major2 = major2
	
	local general1b = CoD.EscalationItemSelectItem_gadget1.new( self, controller )
	general1b:setLeftRight( 0, 0, 218, 358 )
	general1b:setTopBottom( 0, 0, 552, 672 )
	general1b:setZoom( 20 )
	general1b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		general1b:setModel( model, controller )
	end )
	general1b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.general1", function ( model )
		general1b.SelectedItem:setModel( model, controller )
	end )
	self:addElement( general1b )
	self.general1b = general1b
	
	local general1 = CoD.positionLoadoutsSelectionItem_gadget1.new( self, controller )
	general1:setLeftRight( 0, 0, 218, 358 )
	general1:setTopBottom( 0, 0, 552, 672 )
	general1:setAlpha( 0 )
	general1:setZoom( 20 )
	general1:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		general1:setModel( model, controller )
	end )
	general1:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.general1", function ( model )
		general1.selectedItem:setModel( model, controller )
	end )
	self:addElement( general1 )
	self.general1 = general1
	
	local general2b = CoD.EscalationItemSelectItem_gadget2.new( self, controller )
	general2b:setLeftRight( 0, 0, 320, 460 )
	general2b:setTopBottom( 0, 0, 666, 786 )
	general2b:setZoom( 20 )
	general2b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		general2b:setModel( model, controller )
	end )
	general2b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.general2", function ( model )
		general2b.SelectedItem:setModel( model, controller )
	end )
	self:addElement( general2b )
	self.general2b = general2b
	
	local general2 = CoD.positionLoadoutsSelectionItem_gadget2.new( self, controller )
	general2:setLeftRight( 0, 0, 322, 462 )
	general2:setTopBottom( 0, 0, 666, 786 )
	general2:setAlpha( 0 )
	general2:setZoom( 20 )
	general2:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		general2:setModel( model, controller )
	end )
	general2:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.general2", function ( model )
		general2.selectedItem:setModel( model, controller )
	end )
	self:addElement( general2 )
	self.general2 = general2
	
	local general3b = CoD.EscalationItemSelectItem_gadget3.new( self, controller )
	general3b:setLeftRight( 0, 0, 468, 608 )
	general3b:setTopBottom( 0, 0, 667, 787 )
	general3b:setZoom( 20 )
	general3b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		general3b:setModel( model, controller )
	end )
	general3b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.general3", function ( model )
		general3b.SelectedItem:setModel( model, controller )
	end )
	self:addElement( general3b )
	self.general3b = general3b
	
	local general3 = CoD.positionLoadoutsSelectionItem_gadget3.new( self, controller )
	general3:setLeftRight( 0, 0, 468, 608 )
	general3:setTopBottom( 0, 0, 666, 786 )
	general3:setAlpha( 0 )
	general3:setZoom( 20 )
	general3:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		general3:setModel( model, controller )
	end )
	general3:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.general3", function ( model )
		general3.selectedItem:setModel( model, controller )
	end )
	self:addElement( general3 )
	self.general3 = general3
	
	local gadget4b = CoD.EscalationItemSelectItem_gadget4.new( self, controller )
	gadget4b:setLeftRight( 0, 0, 576, 716 )
	gadget4b:setTopBottom( 0, 0, 551, 671 )
	gadget4b:setZoom( 20 )
	gadget4b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		gadget4b:setModel( model, controller )
	end )
	gadget4b:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.general4", function ( model )
		gadget4b.selectedItem:setModel( model, controller )
	end )
	self:addElement( gadget4b )
	self.gadget4b = gadget4b
	
	local general4 = CoD.positionLoadoutsSelectionItem_gadget4.new( self, controller )
	general4:setLeftRight( 0, 0, 576, 716 )
	general4:setTopBottom( 0, 0, 551, 671 )
	general4:setAlpha( 0 )
	general4:setZoom( 20 )
	general4:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		general4:setModel( model, controller )
	end )
	general4:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel.general4", function ( model )
		general4.selectedItem:setModel( model, controller )
	end )
	self:addElement( general4 )
	self.general4 = general4
	
	local MajorLabel = LUI.UITightText.new()
	MajorLabel:setLeftRight( 0, 0, 824, 1081 )
	MajorLabel:setTopBottom( 0, 0, 67, 104 )
	MajorLabel:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	MajorLabel:setAlpha( 0.8 )
	MajorLabel:setZoom( 20 )
	MajorLabel:setText( Engine.Localize( "MPUI_MAJOR_CAPS" ) )
	MajorLabel:setTTF( "fonts/UnitedSansSmCdLt_0.ttf" )
	MajorLabel:setLetterSpacing( 4.5 )
	self:addElement( MajorLabel )
	self.MajorLabel = MajorLabel
	
	local MajorHeavyList = CoD.EscalationSelectInventoryList.new( self, controller )
	MajorHeavyList:setLeftRight( 0, 0, 815, 993 )
	MajorHeavyList:setTopBottom( 0, 0, 104, 474 )
	MajorHeavyList:setZoom( 30 )
	MajorHeavyList:setScale( 0.87 )
	MajorHeavyList.HeaderTextBox:setText( Engine.Localize( "MPUI_LOADOUTSLOT_HEROWEAPON" ) )
	MajorHeavyList.UseStringTextBox:setText( Engine.Localize( "MPUI_LOADOUTSLOT_HEROWEAPON_USAGE" ) )
	MajorHeavyList:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		MajorHeavyList:setModel( model, controller )
	end )
	MajorHeavyList:subscribeToGlobalModel( controller, "PositionEditLoadout", "possibleMajorHeavy", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MajorHeavyList.possibleItemsList:setDataSource( modelValue )
		end
	end )
	self:addElement( MajorHeavyList )
	self.MajorHeavyList = MajorHeavyList
	
	local MajorAbilityList = CoD.EscalationSelectInventoryList.new( self, controller )
	MajorAbilityList:setLeftRight( 0, 0, 993, 1171 )
	MajorAbilityList:setTopBottom( 0, 0, 104, 474 )
	MajorAbilityList:setZoom( 30 )
	MajorAbilityList:setScale( 0.87 )
	MajorAbilityList.HeaderTextBox:setText( Engine.Localize( "MPUI_LOADOUTSLOT_HEROGADGET" ) )
	MajorAbilityList.UseStringTextBox:setText( Engine.Localize( "MPUI_LOADOUTSLOT_HEROGADGET_USAGE" ) )
	MajorAbilityList:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		MajorAbilityList:setModel( model, controller )
	end )
	MajorAbilityList:subscribeToGlobalModel( controller, "PositionEditLoadout", "possibleMajorAbility", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MajorAbilityList.possibleItemsList:setDataSource( modelValue )
		end
	end )
	self:addElement( MajorAbilityList )
	self.MajorAbilityList = MajorAbilityList
	
	local MajorInstantUseList = CoD.EscalationSelectInventoryList.new( self, controller )
	MajorInstantUseList:setLeftRight( 0, 0, 1171, 1349 )
	MajorInstantUseList:setTopBottom( 0, 0, 104, 474 )
	MajorInstantUseList:setZoom( 30 )
	MajorInstantUseList:setScale( 0.87 )
	MajorInstantUseList.HeaderTextBox:setText( Engine.Localize( "MPUI_LOADOUTSLOT_INSTANT_USE" ) )
	MajorInstantUseList.UseStringTextBox:setText( Engine.Localize( "" ) )
	MajorInstantUseList:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		MajorInstantUseList:setModel( model, controller )
	end )
	MajorInstantUseList:subscribeToGlobalModel( controller, "PositionEditLoadout", "possibleMajorInstantUse", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MajorInstantUseList.possibleItemsList:setDataSource( modelValue )
		end
	end )
	self:addElement( MajorInstantUseList )
	self.MajorInstantUseList = MajorInstantUseList
	
	local CoreLabel = LUI.UITightText.new()
	CoreLabel:setLeftRight( 0, 0, 824, 1072 )
	CoreLabel:setTopBottom( 0, 0, 569, 606 )
	CoreLabel:setRGB( ColorSet.Orange.r, ColorSet.Orange.g, ColorSet.Orange.b )
	CoreLabel:setAlpha( 0.8 )
	CoreLabel:setZoom( 20 )
	CoreLabel:setText( Engine.Localize( "MPUI_CORE_CAPS" ) )
	CoreLabel:setTTF( "fonts/UnitedSansSmCdLt_0.ttf" )
	CoreLabel:setLetterSpacing( 4.5 )
	self:addElement( CoreLabel )
	self.CoreLabel = CoreLabel
	
	local CoreSecondaryList = CoD.EscalationSelectInventoryList.new( self, controller )
	CoreSecondaryList:setLeftRight( 0, 0, 815, 993 )
	CoreSecondaryList:setTopBottom( 0, 0, 612, 982 )
	CoreSecondaryList:setZoom( 30 )
	CoreSecondaryList:setScale( 0.87 )
	CoreSecondaryList.HeaderTextBox:setText( Engine.Localize( "MPUI_LOADOUTSLOT_SECONDARY" ) )
	CoreSecondaryList.UseStringTextBox:setText( Engine.Localize( "" ) )
	CoreSecondaryList:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		CoreSecondaryList:setModel( model, controller )
	end )
	CoreSecondaryList:subscribeToGlobalModel( controller, "PositionEditLoadout", "possibleCoreSecondary", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CoreSecondaryList.possibleItemsList:setDataSource( modelValue )
		end
	end )
	self:addElement( CoreSecondaryList )
	self.CoreSecondaryList = CoreSecondaryList
	
	local CoreGearList = CoD.EscalationSelectInventoryList.new( self, controller )
	CoreGearList:setLeftRight( 0, 0, 993, 1171 )
	CoreGearList:setTopBottom( 0, 0, 612, 982 )
	CoreGearList:setZoom( 30 )
	CoreGearList:setScale( 0.87 )
	CoreGearList.HeaderTextBox:setText( Engine.Localize( "MPUI_LOADOUTSLOT_GEAR" ) )
	CoreGearList.UseStringTextBox:setText( Engine.Localize( "MPUI_LOADOUTSLOT_SPECIALGRENADE_USAGE" ) )
	CoreGearList:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		CoreGearList:setModel( model, controller )
	end )
	CoreGearList:subscribeToGlobalModel( controller, "PositionEditLoadout", "possibleCoreGear", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CoreGearList.possibleItemsList:setDataSource( modelValue )
		end
	end )
	self:addElement( CoreGearList )
	self.CoreGearList = CoreGearList
	
	local CoreInstantUseList = CoD.EscalationSelectInventoryList.new( self, controller )
	CoreInstantUseList:setLeftRight( 0, 0, 1171, 1349 )
	CoreInstantUseList:setTopBottom( 0, 0, 612, 982 )
	CoreInstantUseList:setZoom( 30 )
	CoreInstantUseList:setScale( 0.87 )
	CoreInstantUseList.HeaderTextBox:setText( Engine.Localize( "MPUI_LOADOUTSLOT_INSTANT_USE" ) )
	CoreInstantUseList.UseStringTextBox:setText( Engine.Localize( "" ) )
	CoreInstantUseList:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		CoreInstantUseList:setModel( model, controller )
	end )
	CoreInstantUseList:subscribeToGlobalModel( controller, "PositionEditLoadout", "possibleCoreInstantUse", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CoreInstantUseList.possibleItemsList:setDataSource( modelValue )
		end
	end )
	self:addElement( CoreInstantUseList )
	self.CoreInstantUseList = CoreInstantUseList
	
	local CoreAlwaysOnList = CoD.EscalationSelectInventoryList.new( self, controller )
	CoreAlwaysOnList:setLeftRight( 0, 0, 1349, 1527 )
	CoreAlwaysOnList:setTopBottom( 0, 0, 612, 982 )
	CoreAlwaysOnList:setZoom( 30 )
	CoreAlwaysOnList:setScale( 0.87 )
	CoreAlwaysOnList.HeaderTextBox:setText( Engine.Localize( "MPUI_LOADOUTSLOT_ALWAYS_ON" ) )
	CoreAlwaysOnList.UseStringTextBox:setText( Engine.Localize( "" ) )
	CoreAlwaysOnList:subscribeToGlobalModel( controller, "PositionEditLoadout", "classModel", function ( model )
		CoreAlwaysOnList:setModel( model, controller )
	end )
	CoreAlwaysOnList:subscribeToGlobalModel( controller, "PositionEditLoadout", "possibleCoreAlwaysOn", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			CoreAlwaysOnList.possibleItemsList:setDataSource( modelValue )
		end
	end )
	self:addElement( CoreAlwaysOnList )
	self.CoreAlwaysOnList = CoreAlwaysOnList
	
	local wheelBacking2 = LUI.UIImage.new()
	wheelBacking2:setLeftRight( 0, 0, 657, 801 )
	wheelBacking2:setTopBottom( 0, 0, 293, 797 )
	wheelBacking2:setRGB( 0.56, 0.84, 0.81 )
	wheelBacking2:setZoom( 20 )
	wheelBacking2:setImage( RegisterImage( "uie_menu_loadout_frame1" ) )
	self:addElement( wheelBacking2 )
	self.wheelBacking2 = wheelBacking2
	
	local wheelBacking22 = LUI.UIImage.new()
	wheelBacking22:setLeftRight( 0, 0, 134, 278 )
	wheelBacking22:setTopBottom( 0, 0, 293, 797 )
	wheelBacking22:setRGB( 0.56, 0.84, 0.81 )
	wheelBacking22:setYRot( 180 )
	wheelBacking22:setZoom( 20 )
	wheelBacking22:setImage( RegisterImage( "uie_menu_loadout_frame1" ) )
	self:addElement( wheelBacking22 )
	self.wheelBacking22 = wheelBacking22
	
	local FrameLine = LUI.UIImage.new()
	FrameLine:setLeftRight( 0, 0, 789, 1821 )
	FrameLine:setTopBottom( 0, 0, 546, 547 )
	FrameLine:setRGB( 0.56, 0.84, 0.81 )
	FrameLine:setAlpha( 0.15 )
	FrameLine:setZoom( 20 )
	self:addElement( FrameLine )
	self.FrameLine = FrameLine
	
	local FrameLine2 = LUI.UIImage.new()
	FrameLine2:setLeftRight( 0, 0, 95, 137 )
	FrameLine2:setTopBottom( 0, 0, 546, 547 )
	FrameLine2:setRGB( 0.56, 0.84, 0.81 )
	FrameLine2:setAlpha( 0.15 )
	FrameLine2:setZoom( 20 )
	self:addElement( FrameLine2 )
	self.FrameLine2 = FrameLine2
	
	local blur1 = LUI.UIImage.new()
	blur1:setLeftRight( 0, 0, 765, 801 )
	blur1:setTopBottom( 0, 0, 426, 666 )
	blur1:setRGB( 0.41, 0.72, 0.82 )
	blur1:setAlpha( 0.65 )
	blur1:setZoom( 25 )
	blur1:setImage( RegisterImage( "uie_menu_loadout_frame2" ) )
	self:addElement( blur1 )
	self.blur1 = blur1
	
	local blur1b = LUI.UIImage.new()
	blur1b:setLeftRight( 0, 0, 135, 171 )
	blur1b:setTopBottom( 0, 0, 426, 666 )
	blur1b:setRGB( 0.41, 0.72, 0.82 )
	blur1b:setAlpha( 0.65 )
	blur1b:setZRot( 180 )
	blur1b:setZoom( 25 )
	blur1b:setImage( RegisterImage( "uie_menu_loadout_frame2" ) )
	self:addElement( blur1b )
	self.blur1b = blur1b
	
	local blur2 = LUI.UIImage.new()
	blur2:setLeftRight( 0, 0, 150, 186 )
	blur2:setTopBottom( 0, 0, 522, 571 )
	blur2:setRGB( 0.56, 0.84, 0.81 )
	blur2:setAlpha( 0.5 )
	blur2:setZRot( 180 )
	blur2:setZoom( 35 )
	blur2:setImage( RegisterImage( "uie_menu_loadout_blur1" ) )
	self:addElement( blur2 )
	self.blur2 = blur2
	
	local blur2b = LUI.UIImage.new()
	blur2b:setLeftRight( 0, 0, 755, 791 )
	blur2b:setTopBottom( 0, 0, 522, 571 )
	blur2b:setRGB( 0.56, 0.84, 0.81 )
	blur2b:setAlpha( 0.5 )
	blur2b:setZoom( 35 )
	blur2b:setImage( RegisterImage( "uie_menu_loadout_blur1" ) )
	self:addElement( blur2b )
	self.blur2b = blur2b
	
	local blur3 = LUI.UIImage.new()
	blur3:setLeftRight( 0, 0, 116, 260 )
	blur3:setTopBottom( 0, 0, 293, 797 )
	blur3:setRGB( 0.56, 0.84, 0.81 )
	blur3:setAlpha( 0.15 )
	blur3:setYRot( 180 )
	blur3:setZoom( 40 )
	blur3:setScale( 1.1 )
	blur3:setImage( RegisterImage( "uie_menu_loadout_frame1blur" ) )
	self:addElement( blur3 )
	self.blur3 = blur3
	
	local blur3b = LUI.UIImage.new()
	blur3b:setLeftRight( 0, 0, 680, 824 )
	blur3b:setTopBottom( 0, 0, 293, 797 )
	blur3b:setRGB( 0.56, 0.84, 0.81 )
	blur3b:setAlpha( 0.15 )
	blur3b:setZoom( 40 )
	blur3b:setScale( 1.1 )
	blur3b:setImage( RegisterImage( "uie_menu_loadout_frame1blur" ) )
	self:addElement( blur3b )
	self.blur3b = blur3b
	
	local blurBottom = LUI.UIImage.new()
	blurBottom:setLeftRight( 0, 0, 394, 522 )
	blurBottom:setTopBottom( 0, 0, 929, 1123 )
	blurBottom:setAlpha( 0.02 )
	blurBottom:setZoom( 60 )
	blurBottom:setScale( 1.5 )
	blurBottom:setImage( RegisterImage( "uie_menu_loadout_blur2" ) )
	blurBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( blurBottom )
	self.blurBottom = blurBottom
	
	local blurTop = LUI.UIImage.new()
	blurTop:setLeftRight( 0, 0, 394, 538 )
	blurTop:setTopBottom( 0, 0, -35, 157 )
	blurTop:setAlpha( 0.02 )
	blurTop:setZoom( 60 )
	blurTop:setScale( 1.5 )
	blurTop:setImage( RegisterImage( "uie_menu_loadout_blur2" ) )
	blurTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( blurTop )
	self.blurTop = blurTop
	
	local blurTop2 = LUI.UIImage.new()
	blurTop2:setLeftRight( 0, 0, -234, 150 )
	blurTop2:setTopBottom( 0, 0, 486, 594 )
	blurTop2:setAlpha( 0.02 )
	blurTop2:setZoom( 60 )
	blurTop2:setScale( 1.2 )
	blurTop2:setImage( RegisterImage( "uie_menu_loadout_blur3" ) )
	blurTop2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( blurTop2 )
	self.blurTop2 = blurTop2
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( 0, 0, 1635, 2019 )
	Image2:setTopBottom( 0, 0, 486, 594 )
	Image2:setAlpha( 0.02 )
	Image2:setZoom( 60 )
	Image2:setScale( 1.2 )
	Image2:setImage( RegisterImage( "uie_menu_loadout_blur3" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local blurRadialTop = LUI.UIImage.new()
	blurRadialTop:setLeftRight( 0, 0, 225, 729 )
	blurRadialTop:setTopBottom( 0, 0, 54, 234 )
	blurRadialTop:setRGB( 1, 0.57, 0 )
	blurRadialTop:setAlpha( 0.01 )
	blurRadialTop:setZoom( 20 )
	blurRadialTop:setScale( 1.5 )
	blurRadialTop:setImage( RegisterImage( "uie_menu_loadout_blur4" ) )
	blurRadialTop:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( blurRadialTop )
	self.blurRadialTop = blurRadialTop
	
	local blurRadialBottom = LUI.UIImage.new()
	blurRadialBottom:setLeftRight( 0, 0, 225, 729 )
	blurRadialBottom:setTopBottom( 0, 0, 846, 1026 )
	blurRadialBottom:setRGB( 1, 0.57, 0 )
	blurRadialBottom:setAlpha( 0.01 )
	blurRadialBottom:setXRot( 180 )
	blurRadialBottom:setZoom( 20 )
	blurRadialBottom:setScale( 1.5 )
	blurRadialBottom:setImage( RegisterImage( "uie_menu_loadout_blur4" ) )
	blurRadialBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( blurRadialBottom )
	self.blurRadialBottom = blurRadialBottom
	
	local blktint = CoD.EscalationItemSelectTintButtons.new( self, controller )
	blktint:mergeStateConditions( {
		{
			stateName = "Top",
			condition = function ( menu, element, event )
				return IsFreeCursorOnTopOfScreen( controller )
			end
		},
		{
			stateName = "Bottom",
			condition = function ( menu, element, event )
				return not IsFreeCursorOnTopOfScreen( controller )
			end
		}
	} )
	blktint:subscribeToModel( Engine.GetModel( DataSources.FreeCursor.getModel( controller ), "position" ), function ( model )
		self:updateElementState( blktint, {
			name = "model_validation",
			menu = self,
			modelValue = Engine.GetModelValue( model ),
			modelName = "position"
		} )
	end )
	blktint:setLeftRight( 0, 0, 0, 1920 )
	blktint:setTopBottom( 0, 0, 4, 1084 )
	blktint:setZoom( 20 )
	self:addElement( blktint )
	self.blktint = blktint
	
	major1b.navigation = {
		right = {
			major2b,
			major2
		},
		down = {
			general1b,
			general1
		}
	}
	major1.navigation = {
		right = {
			major2b,
			major2
		},
		down = {
			general1b,
			general1
		}
	}
	major2b.navigation = {
		left = {
			major1b,
			major1
		},
		right = MajorHeavyList,
		down = {
			gadget4b,
			general4
		}
	}
	major2.navigation = {
		left = {
			major1b,
			major1
		},
		right = MajorHeavyList,
		down = {
			gadget4b,
			general4
		}
	}
	general1b.navigation = {
		up = {
			major1b,
			major1
		},
		right = general2b,
		down = {
			general2b,
			general2
		}
	}
	general1.navigation = {
		up = {
			major1b,
			major1
		},
		right = general2b,
		down = {
			general2b,
			general2
		}
	}
	general2b.navigation = {
		left = {
			general1b,
			general1
		},
		up = {
			general1b,
			general1
		},
		right = general2
	}
	general2.navigation = {
		left = general2b,
		up = {
			general1b,
			general1
		},
		right = {
			general3,
			general3b
		}
	}
	general3b.navigation = {
		left = general2,
		up = general3,
		right = {
			gadget4b,
			general4
		}
	}
	general3.navigation = {
		left = general2,
		up = {
			gadget4b,
			general4
		},
		right = {
			gadget4b,
			general4
		},
		down = general3b
	}
	gadget4b.navigation = {
		left = {
			general3,
			general3b
		},
		up = {
			major2b,
			major2
		},
		right = CoreSecondaryList,
		down = general3
	}
	general4.navigation = {
		left = {
			general3,
			general3b
		},
		up = {
			major2b,
			major2
		},
		right = CoreSecondaryList,
		down = general3
	}
	MajorHeavyList.navigation = {
		left = {
			major2b,
			major2
		},
		right = MajorAbilityList,
		down = CoreSecondaryList
	}
	MajorAbilityList.navigation = {
		left = MajorHeavyList,
		right = MajorInstantUseList,
		down = CoreGearList
	}
	MajorInstantUseList.navigation = {
		left = MajorAbilityList,
		down = CoreInstantUseList
	}
	CoreSecondaryList.navigation = {
		left = {
			gadget4b,
			general4
		},
		up = MajorHeavyList,
		right = CoreGearList
	}
	CoreGearList.navigation = {
		left = CoreSecondaryList,
		up = MajorAbilityList,
		right = CoreInstantUseList
	}
	CoreInstantUseList.navigation = {
		left = CoreGearList,
		up = MajorInstantUseList,
		right = CoreAlwaysOnList
	}
	CoreAlwaysOnList.navigation = {
		left = CoreInstantUseList
	}
	self.resetProperties = function ()
		Image2:completeAnimation()
		blurTop2:completeAnimation()
		blurTop:completeAnimation()
		blurBottom:completeAnimation()
		blurRadialTop:completeAnimation()
		blurRadialBottom:completeAnimation()
		blur3:completeAnimation()
		blur3b:completeAnimation()
		blur1:completeAnimation()
		blur1b:completeAnimation()
		wheelBacking:completeAnimation()
		MajorAbilityList:completeAnimation()
		MajorHeavyList:completeAnimation()
		MajorInstantUseList:completeAnimation()
		CoreSecondaryList:completeAnimation()
		general1b:completeAnimation()
		CoreGearList:completeAnimation()
		general2b:completeAnimation()
		CoreInstantUseList:completeAnimation()
		general3b:completeAnimation()
		CoreAlwaysOnList:completeAnimation()
		gadget4b:completeAnimation()
		major1b:completeAnimation()
		CoreLabel:completeAnimation()
		MajorLabel:completeAnimation()
		major2b:completeAnimation()
		Image2:setLeftRight( 0, 0, 1635, 2019 )
		Image2:setTopBottom( 0, 0, 486, 594 )
		blurTop2:setLeftRight( 0, 0, -234, 150 )
		blurTop2:setTopBottom( 0, 0, 486, 594 )
		blurTop:setLeftRight( 0, 0, 394, 538 )
		blurTop:setTopBottom( 0, 0, -35, 157 )
		blurBottom:setLeftRight( 0, 0, 394, 522 )
		blurBottom:setTopBottom( 0, 0, 929, 1123 )
		blurRadialTop:setLeftRight( 0, 0, 225, 729 )
		blurRadialTop:setTopBottom( 0, 0, 54, 234 )
		blurRadialBottom:setLeftRight( 0, 0, 225, 729 )
		blurRadialBottom:setTopBottom( 0, 0, 846, 1026 )
		blur3:setAlpha( 0.15 )
		blur3b:setAlpha( 0.15 )
		blur1:setLeftRight( 0, 0, 765, 801 )
		blur1:setTopBottom( 0, 0, 426, 666 )
		blur1b:setLeftRight( 0, 0, 135, 171 )
		blur1b:setTopBottom( 0, 0, 426, 666 )
		wheelBacking:setAlpha( 0.7 )
		wheelBacking:setScale( 0.95 )
		MajorAbilityList:setLeftRight( 0, 0, 993, 1171 )
		MajorAbilityList:setTopBottom( 0, 0, 104, 474 )
		MajorAbilityList:setAlpha( 1 )
		MajorAbilityList:setScale( 0.87 )
		MajorHeavyList:setLeftRight( 0, 0, 815, 993 )
		MajorHeavyList:setTopBottom( 0, 0, 104, 474 )
		MajorHeavyList:setAlpha( 1 )
		MajorHeavyList:setScale( 0.87 )
		MajorInstantUseList:setLeftRight( 0, 0, 1171, 1349 )
		MajorInstantUseList:setTopBottom( 0, 0, 104, 474 )
		MajorInstantUseList:setAlpha( 1 )
		MajorInstantUseList:setScale( 0.87 )
		CoreSecondaryList:setLeftRight( 0, 0, 815, 993 )
		CoreSecondaryList:setTopBottom( 0, 0, 612, 982 )
		CoreSecondaryList:setAlpha( 1 )
		CoreSecondaryList:setScale( 0.87 )
		general1b:setAlpha( 1 )
		CoreGearList:setLeftRight( 0, 0, 993, 1171 )
		CoreGearList:setTopBottom( 0, 0, 612, 982 )
		CoreGearList:setAlpha( 1 )
		CoreGearList:setScale( 0.87 )
		general2b:setAlpha( 1 )
		CoreInstantUseList:setLeftRight( 0, 0, 1171, 1349 )
		CoreInstantUseList:setTopBottom( 0, 0, 612, 982 )
		CoreInstantUseList:setAlpha( 1 )
		CoreInstantUseList:setScale( 0.87 )
		general3b:setAlpha( 1 )
		CoreAlwaysOnList:setLeftRight( 0, 0, 1349, 1527 )
		CoreAlwaysOnList:setTopBottom( 0, 0, 612, 982 )
		CoreAlwaysOnList:setAlpha( 1 )
		CoreAlwaysOnList:setScale( 0.87 )
		gadget4b:setAlpha( 1 )
		major1b:setAlpha( 1 )
		CoreLabel:setAlpha( 0.8 )
		MajorLabel:setAlpha( 0.8 )
		major2b:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 26 )
				local wheelBackingFrame2 = function ( wheelBacking, event )
					local wheelBackingFrame3 = function ( wheelBacking, event )
						if not event.interrupted then
							wheelBacking:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
						end
						wheelBacking:setAlpha( 0.8 )
						wheelBacking:setScale( 0.95 )
						if event.interrupted then
							self.clipFinished( wheelBacking, event )
						else
							wheelBacking:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						wheelBackingFrame3( wheelBacking, event )
						return 
					else
						wheelBacking:beginAnimation( "keyframe", 230, false, false, CoD.TweenType.Linear )
						wheelBacking:registerEventHandler( "transition_complete_keyframe", wheelBackingFrame3 )
					end
				end
				
				wheelBacking:completeAnimation()
				self.wheelBacking:setAlpha( 0 )
				self.wheelBacking:setScale( 0.9 )
				wheelBackingFrame2( wheelBacking, {} )
				local major1bFrame2 = function ( major1b, event )
					if not event.interrupted then
						major1b:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					major1b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( major1b, event )
					else
						major1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				major1b:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				major1b:setAlpha( 0 )
				major1b:registerEventHandler( "transition_complete_keyframe", major1bFrame2 )
				local major2bFrame2 = function ( major2b, event )
					if not event.interrupted then
						major2b:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
					end
					major2b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( major2b, event )
					else
						major2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				major2b:beginAnimation( "keyframe", 219, false, false, CoD.TweenType.Linear )
				major2b:setAlpha( 0 )
				major2b:registerEventHandler( "transition_complete_keyframe", major2bFrame2 )
				local general1bFrame2 = function ( general1b, event )
					if not event.interrupted then
						general1b:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					general1b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( general1b, event )
					else
						general1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				general1b:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				general1b:setAlpha( 0 )
				general1b:registerEventHandler( "transition_complete_keyframe", general1bFrame2 )
				local general2bFrame2 = function ( general2b, event )
					if not event.interrupted then
						general2b:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
					end
					general2b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( general2b, event )
					else
						general2b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				general2b:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
				general2b:setAlpha( 0 )
				general2b:registerEventHandler( "transition_complete_keyframe", general2bFrame2 )
				local general3bFrame2 = function ( general3b, event )
					if not event.interrupted then
						general3b:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
					end
					general3b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( general3b, event )
					else
						general3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				general3b:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				general3b:setAlpha( 0 )
				general3b:registerEventHandler( "transition_complete_keyframe", general3bFrame2 )
				local gadget4bFrame2 = function ( gadget4b, event )
					if not event.interrupted then
						gadget4b:beginAnimation( "keyframe", 199, false, false, CoD.TweenType.Linear )
					end
					gadget4b:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( gadget4b, event )
					else
						gadget4b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gadget4b:beginAnimation( "keyframe", 180, false, false, CoD.TweenType.Linear )
				gadget4b:setAlpha( 0 )
				gadget4b:registerEventHandler( "transition_complete_keyframe", gadget4bFrame2 )
				local MajorLabelFrame2 = function ( MajorLabel, event )
					if not event.interrupted then
						MajorLabel:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					MajorLabel:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( MajorLabel, event )
					else
						MajorLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MajorLabel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				MajorLabel:setAlpha( 0 )
				MajorLabel:registerEventHandler( "transition_complete_keyframe", MajorLabelFrame2 )
				local MajorHeavyListFrame2 = function ( MajorHeavyList, event )
					if not event.interrupted then
						MajorHeavyList:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					MajorHeavyList:setLeftRight( 0, 0, 815, 993 )
					MajorHeavyList:setTopBottom( 0, 0, 104, 474 )
					MajorHeavyList:setAlpha( 1 )
					MajorHeavyList:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( MajorHeavyList, event )
					else
						MajorHeavyList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MajorHeavyList:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				MajorHeavyList:setLeftRight( 0, 0, 868, 1046 )
				MajorHeavyList:setTopBottom( 0, 0, 104, 474 )
				MajorHeavyList:setAlpha( 0 )
				MajorHeavyList:setScale( 0.85 )
				MajorHeavyList:registerEventHandler( "transition_complete_keyframe", MajorHeavyListFrame2 )
				local MajorAbilityListFrame2 = function ( MajorAbilityList, event )
					if not event.interrupted then
						MajorAbilityList:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					MajorAbilityList:setLeftRight( 0, 0, 993, 1171 )
					MajorAbilityList:setTopBottom( 0, 0, 104, 474 )
					MajorAbilityList:setAlpha( 1 )
					MajorAbilityList:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( MajorAbilityList, event )
					else
						MajorAbilityList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MajorAbilityList:beginAnimation( "keyframe", 29, false, false, CoD.TweenType.Linear )
				MajorAbilityList:setLeftRight( 0, 0, 1028, 1206 )
				MajorAbilityList:setTopBottom( 0, 0, 104, 474 )
				MajorAbilityList:setAlpha( 0 )
				MajorAbilityList:setScale( 0.85 )
				MajorAbilityList:registerEventHandler( "transition_complete_keyframe", MajorAbilityListFrame2 )
				local MajorInstantUseListFrame2 = function ( MajorInstantUseList, event )
					if not event.interrupted then
						MajorInstantUseList:beginAnimation( "keyframe", 140, false, false, CoD.TweenType.Linear )
					end
					MajorInstantUseList:setLeftRight( 0, 0, 1172.5, 1350.5 )
					MajorInstantUseList:setTopBottom( 0, 0, 104, 474 )
					MajorInstantUseList:setAlpha( 1 )
					MajorInstantUseList:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( MajorInstantUseList, event )
					else
						MajorInstantUseList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				MajorInstantUseList:beginAnimation( "keyframe", 59, false, false, CoD.TweenType.Linear )
				MajorInstantUseList:setLeftRight( 0, 0, 1216, 1394 )
				MajorInstantUseList:setTopBottom( 0, 0, 104, 474 )
				MajorInstantUseList:setAlpha( 0 )
				MajorInstantUseList:setScale( 0.85 )
				MajorInstantUseList:registerEventHandler( "transition_complete_keyframe", MajorInstantUseListFrame2 )
				local CoreLabelFrame2 = function ( CoreLabel, event )
					if not event.interrupted then
						CoreLabel:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
					end
					CoreLabel:setAlpha( 0.8 )
					if event.interrupted then
						self.clipFinished( CoreLabel, event )
					else
						CoreLabel:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CoreLabel:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
				CoreLabel:setAlpha( 0 )
				CoreLabel:registerEventHandler( "transition_complete_keyframe", CoreLabelFrame2 )
				local CoreSecondaryListFrame2 = function ( CoreSecondaryList, event )
					if not event.interrupted then
						CoreSecondaryList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					CoreSecondaryList:setLeftRight( 0, 0, 815, 993 )
					CoreSecondaryList:setTopBottom( 0, 0, 612, 982 )
					CoreSecondaryList:setAlpha( 1 )
					CoreSecondaryList:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( CoreSecondaryList, event )
					else
						CoreSecondaryList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CoreSecondaryList:beginAnimation( "keyframe", 79, false, false, CoD.TweenType.Linear )
				CoreSecondaryList:setLeftRight( 0, 0, 850, 1028 )
				CoreSecondaryList:setTopBottom( 0, 0, 612, 982 )
				CoreSecondaryList:setAlpha( 0 )
				CoreSecondaryList:setScale( 0.85 )
				CoreSecondaryList:registerEventHandler( "transition_complete_keyframe", CoreSecondaryListFrame2 )
				local CoreGearListFrame2 = function ( CoreGearList, event )
					if not event.interrupted then
						CoreGearList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					CoreGearList:setLeftRight( 0, 0, 994.5, 1172.5 )
					CoreGearList:setTopBottom( 0, 0, 612, 982 )
					CoreGearList:setAlpha( 1 )
					CoreGearList:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( CoreGearList, event )
					else
						CoreGearList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CoreGearList:beginAnimation( "keyframe", 100, false, false, CoD.TweenType.Linear )
				CoreGearList:setLeftRight( 0, 0, 1025.5, 1203.5 )
				CoreGearList:setTopBottom( 0, 0, 612, 982 )
				CoreGearList:setAlpha( 0 )
				CoreGearList:setScale( 0.85 )
				CoreGearList:registerEventHandler( "transition_complete_keyframe", CoreGearListFrame2 )
				local CoreInstantUseListFrame2 = function ( CoreInstantUseList, event )
					if not event.interrupted then
						CoreInstantUseList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					CoreInstantUseList:setLeftRight( 0, 0, 1172.5, 1350.5 )
					CoreInstantUseList:setTopBottom( 0, 0, 612, 982 )
					CoreInstantUseList:setAlpha( 1 )
					CoreInstantUseList:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( CoreInstantUseList, event )
					else
						CoreInstantUseList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CoreInstantUseList:beginAnimation( "keyframe", 129, false, false, CoD.TweenType.Linear )
				CoreInstantUseList:setLeftRight( 0, 0, 1216, 1394 )
				CoreInstantUseList:setTopBottom( 0, 0, 612, 982 )
				CoreInstantUseList:setAlpha( 0 )
				CoreInstantUseList:setScale( 0.85 )
				CoreInstantUseList:registerEventHandler( "transition_complete_keyframe", CoreInstantUseListFrame2 )
				local CoreAlwaysOnListFrame2 = function ( CoreAlwaysOnList, event )
					if not event.interrupted then
						CoreAlwaysOnList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
					end
					CoreAlwaysOnList:setLeftRight( 0, 0, 1350.5, 1528.5 )
					CoreAlwaysOnList:setTopBottom( 0, 0, 612, 982 )
					CoreAlwaysOnList:setAlpha( 1 )
					CoreAlwaysOnList:setScale( 0.9 )
					if event.interrupted then
						self.clipFinished( CoreAlwaysOnList, event )
					else
						CoreAlwaysOnList:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				CoreAlwaysOnList:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
				CoreAlwaysOnList:setLeftRight( 0, 0, 1388, 1566 )
				CoreAlwaysOnList:setTopBottom( 0, 0, 612, 982 )
				CoreAlwaysOnList:setAlpha( 0 )
				CoreAlwaysOnList:setScale( 0.85 )
				CoreAlwaysOnList:registerEventHandler( "transition_complete_keyframe", CoreAlwaysOnListFrame2 )
				local blur1Frame2 = function ( blur1, event )
					if not event.interrupted then
						blur1:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					blur1:setLeftRight( 0, 0, 765, 801 )
					blur1:setTopBottom( 0, 0, 426, 666 )
					if event.interrupted then
						self.clipFinished( blur1, event )
					else
						blur1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				blur1:completeAnimation()
				self.blur1:setLeftRight( 0, 0, 1028, 1064 )
				self.blur1:setTopBottom( 0, 0, 426, 666 )
				blur1Frame2( blur1, {} )
				local blur1bFrame2 = function ( blur1b, event )
					if not event.interrupted then
						blur1b:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
					end
					blur1b:setLeftRight( 0, 0, 135, 171 )
					blur1b:setTopBottom( 0, 0, 426, 666 )
					if event.interrupted then
						self.clipFinished( blur1b, event )
					else
						blur1b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				blur1b:completeAnimation()
				self.blur1b:setLeftRight( 0, 0, -73, -37 )
				self.blur1b:setTopBottom( 0, 0, 426, 666 )
				blur1bFrame2( blur1b, {} )
				local blur3Frame2 = function ( blur3, event )
					if not event.interrupted then
						blur3:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					blur3:setAlpha( 0.15 )
					if event.interrupted then
						self.clipFinished( blur3, event )
					else
						blur3:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				blur3:completeAnimation()
				self.blur3:setAlpha( 0 )
				blur3Frame2( blur3, {} )
				local blur3bFrame2 = function ( blur3b, event )
					if not event.interrupted then
						blur3b:beginAnimation( "keyframe", 119, false, false, CoD.TweenType.Linear )
					end
					blur3b:setAlpha( 0.15 )
					if event.interrupted then
						self.clipFinished( blur3b, event )
					else
						blur3b:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				blur3b:completeAnimation()
				self.blur3b:setAlpha( 0 )
				blur3bFrame2( blur3b, {} )
				local blurBottomFrame2 = function ( blurBottom, event )
					if not event.interrupted then
						blurBottom:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					blurBottom:setLeftRight( 0, 0, 394, 522 )
					blurBottom:setTopBottom( 0, 0, 929, 1123 )
					if event.interrupted then
						self.clipFinished( blurBottom, event )
					else
						blurBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				blurBottom:completeAnimation()
				self.blurBottom:setLeftRight( 0, 0, 394, 522 )
				self.blurBottom:setTopBottom( 0, 0, 1080, 1274 )
				blurBottomFrame2( blurBottom, {} )
				local blurTopFrame2 = function ( blurTop, event )
					if not event.interrupted then
						blurTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					blurTop:setLeftRight( 0, 0, 394, 538 )
					blurTop:setTopBottom( 0, 0, -35, 157 )
					if event.interrupted then
						self.clipFinished( blurTop, event )
					else
						blurTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				blurTop:completeAnimation()
				self.blurTop:setLeftRight( 0, 0, 394, 538 )
				self.blurTop:setTopBottom( 0, 0, -189, 3 )
				blurTopFrame2( blurTop, {} )
				local blurTop2Frame2 = function ( blurTop2, event )
					if not event.interrupted then
						blurTop2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					blurTop2:setLeftRight( 0, 0, -289, 95 )
					blurTop2:setTopBottom( 0, 0, 486, 594 )
					if event.interrupted then
						self.clipFinished( blurTop2, event )
					else
						blurTop2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				blurTop2:completeAnimation()
				self.blurTop2:setLeftRight( 0, 0, -490, -106 )
				self.blurTop2:setTopBottom( 0, 0, 486, 594 )
				blurTop2Frame2( blurTop2, {} )
				local Image2Frame2 = function ( Image2, event )
					if not event.interrupted then
						Image2:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					Image2:setLeftRight( 0, 0, 1635, 2019 )
					Image2:setTopBottom( 0, 0, 486, 594 )
					if event.interrupted then
						self.clipFinished( Image2, event )
					else
						Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setLeftRight( 0, 0, 1920, 2304 )
				self.Image2:setTopBottom( 0, 0, 486, 594 )
				Image2Frame2( Image2, {} )
				local blurRadialTopFrame2 = function ( blurRadialTop, event )
					if not event.interrupted then
						blurRadialTop:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					blurRadialTop:setLeftRight( 0, 0, 225, 729 )
					blurRadialTop:setTopBottom( 0, 0, 54, 234 )
					if event.interrupted then
						self.clipFinished( blurRadialTop, event )
					else
						blurRadialTop:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				blurRadialTop:completeAnimation()
				self.blurRadialTop:setLeftRight( 0, 0, 225, 729 )
				self.blurRadialTop:setTopBottom( 0, 0, -180, 0 )
				blurRadialTopFrame2( blurRadialTop, {} )
				local blurRadialBottomFrame2 = function ( blurRadialBottom, event )
					if not event.interrupted then
						blurRadialBottom:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					blurRadialBottom:setLeftRight( 0, 0, 225, 729 )
					blurRadialBottom:setTopBottom( 0, 0, 846, 1026 )
					if event.interrupted then
						self.clipFinished( blurRadialBottom, event )
					else
						blurRadialBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				blurRadialBottom:completeAnimation()
				self.blurRadialBottom:setLeftRight( 0, 0, 225, 729 )
				self.blurRadialBottom:setTopBottom( 0, 0, 1080, 1260 )
				blurRadialBottomFrame2( blurRadialBottom, {} )
			end
		}
	}
	CoD.Menu.AddNavigationHandler( self, self, controller )
	self:AddButtonCallbackFunction( self, controller, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "ESCAPE", function ( element, menu, controller, model )
		if InFrontend() then
			SetControllerModelValue( controller, "PositionDraft.isEscalationWheelFocusCounter", 0 )
			CoD.PlayerRoleUtility.GoBackUpdatePositionsLoadout( self, controller )
			return true
		else
			SetControllerModelValue( controller, "PositionDraft.isEscalationWheelFocusCounter", 0 )
			GoBack( self, controller )
			return true
		end
	end, function ( element, menu, controller )
		CoD.Menu.SetButtonLabel( menu, Enum.LUIButton.LUI_KEY_XBB_PSCIRCLE, "", nil )
		return false
	end, false )
	GenericMenuFrame0:setModel( self.buttonModel, controller )
	major1b.id = "major1b"
	major1.id = "major1"
	major2b.id = "major2b"
	major2.id = "major2"
	general1b.id = "general1b"
	general1.id = "general1"
	general2b.id = "general2b"
	general2.id = "general2"
	general3b.id = "general3b"
	general3.id = "general3"
	gadget4b.id = "gadget4b"
	general4.id = "general4"
	MajorHeavyList.id = "MajorHeavyList"
	MajorAbilityList.id = "MajorAbilityList"
	MajorInstantUseList.id = "MajorInstantUseList"
	CoreSecondaryList.id = "CoreSecondaryList"
	CoreGearList.id = "CoreGearList"
	CoreInstantUseList.id = "CoreInstantUseList"
	CoreAlwaysOnList.id = "CoreAlwaysOnList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = self
	} )
	if not self:restoreState() then
		self.MajorAbilityList:processEvent( {
			name = "gain_focus",
			controller = controller
		} )
	end
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.glowbuttons:close()
		self.GenericMenuFrame0:close()
		self.major1b:close()
		self.major1:close()
		self.major2b:close()
		self.major2:close()
		self.general1b:close()
		self.general1:close()
		self.general2b:close()
		self.general2:close()
		self.general3b:close()
		self.general3:close()
		self.gadget4b:close()
		self.general4:close()
		self.MajorHeavyList:close()
		self.MajorAbilityList:close()
		self.MajorInstantUseList:close()
		self.CoreSecondaryList:close()
		self.CoreGearList:close()
		self.CoreInstantUseList:close()
		self.CoreAlwaysOnList:close()
		self.blktint:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "EscalationItemSelect.buttonPrompts" ) )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	return self
end

