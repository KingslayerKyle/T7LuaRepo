require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )
require( "ui.uieditor.widgets.CAC.cac_CustomClassDecscription" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.Specialist.PersonalizeSpecTitle" )

CoD.PersonalizeHero_InfoBlock = InheritFrom( LUI.UIElement )
CoD.PersonalizeHero_InfoBlock.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.PersonalizeHero_InfoBlock )
	self.id = "PersonalizeHero_InfoBlock"
	self.soundSet = "CAC_EditLoadout"
	self:setLeftRight( 0, 0, 0, 600 )
	self:setTopBottom( 0, 0, 0, 706 )
	self.anyChildUsesUpdateState = true
	
	local CategoryDesc = CoD.cac_CustomClassDecscription.new( menu, controller )
	CategoryDesc:setLeftRight( 0, 0, 0, 504 )
	CategoryDesc:setTopBottom( 0, 0, 100.5, 133.5 )
	CategoryDesc.weaponDescTextBox:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_DESC" ) )
	self:addElement( CategoryDesc )
	self.CategoryDesc = CategoryDesc
	
	local PersonalizeSpecTitle = CoD.PersonalizeSpecTitle.new( menu, controller )
	PersonalizeSpecTitle:setLeftRight( 0, 0, 0, 600 )
	PersonalizeSpecTitle:setTopBottom( 0, 0, 0, 48 )
	PersonalizeSpecTitle.weaponNameLabel:setText( LocalizeToUpperString( "MENU_NEW" ) )
	self:addElement( PersonalizeSpecTitle )
	self.PersonalizeSpecTitle = PersonalizeSpecTitle
	
	local CurrentlyEquippedInfo = CoD.InfoPaneItemName.new( menu, controller )
	CurrentlyEquippedInfo:mergeStateConditions( {
		{
			stateName = "Equipped",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		},
		{
			stateName = "Available",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NeedsWildcard",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotEquippable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		},
		{
			stateName = "NotAvailable",
			condition = function ( menu, element, event )
				return AlwaysFalse()
			end
		}
	} )
	CurrentlyEquippedInfo:setLeftRight( 0, 0, 0, 600 )
	CurrentlyEquippedInfo:setTopBottom( 0, 0, 42.5, 93.5 )
	CurrentlyEquippedInfo.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	CurrentlyEquippedInfo.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
	self:addElement( CurrentlyEquippedInfo )
	self.CurrentlyEquippedInfo = CurrentlyEquippedInfo
	
	local CryptokeyTypeNameLeft = CoD.CryptokeyTypeNameLeft.new( menu, controller )
	CryptokeyTypeNameLeft:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				local f7_local0
				if not IsSelfModelValueTrue( element, controller, "isBMClassified" ) then
					f7_local0 = IsSelfModelValueNonEmptyString( element, controller, "rarity" )
				else
					f7_local0 = false
				end
				return f7_local0
			end
		}
	} )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "isBMClassified", true, function ( model )
		menu:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "isBMClassified"
		} )
	end )
	CryptokeyTypeNameLeft:linkToElementModel( CryptokeyTypeNameLeft, "rarity", true, function ( model )
		menu:updateElementState( CryptokeyTypeNameLeft, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "rarity"
		} )
	end )
	CryptokeyTypeNameLeft:setLeftRight( 0, 0, 0, 166 )
	CryptokeyTypeNameLeft:setTopBottom( 1, 1, 22.5, 55.5 )
	self:addElement( CryptokeyTypeNameLeft )
	self.CryptokeyTypeNameLeft = CryptokeyTypeNameLeft
	
	self.resetProperties = function ()
		CategoryDesc:completeAnimation()
		CategoryDesc:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				CategoryDesc:completeAnimation()
				self.CategoryDesc:setAlpha( 0 )
				self.clipFinished( CategoryDesc, {} )
			end
		},
		ShowCurrentlyEquippedInfo = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.CategoryDesc:close()
		self.PersonalizeSpecTitle:close()
		self.CurrentlyEquippedInfo:close()
		self.CryptokeyTypeNameLeft:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

