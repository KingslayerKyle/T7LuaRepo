-- f0ad06a528b57fbd713a256433d68633
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CAC.cac_CustomClassDecscription" )
require( "ui.uieditor.widgets.Specialist.PersonalizeSpecTitle" )
require( "ui.uieditor.widgets.CAC.MenuChooseClass.ItemWidgets.InfoPaneItemName" )
require( "ui.uieditor.widgets.BlackMarket.CryptokeyTypeNameLeft" )

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
	self:setLeftRight( true, false, 0, 400 )
	self:setTopBottom( true, false, 0, 471 )
	self.anyChildUsesUpdateState = true
	
	local CategoryDesc = CoD.cac_CustomClassDecscription.new( menu, controller )
	CategoryDesc:setLeftRight( true, false, 0, 336 )
	CategoryDesc:setTopBottom( true, false, 67, 89 )
	CategoryDesc.weaponDescTextBox:setText( Engine.Localize( "HEROES_SHOWCASE_WEAPON_DESC" ) )
	self:addElement( CategoryDesc )
	self.CategoryDesc = CategoryDesc
	
	local PersonalizeSpecTitle = CoD.PersonalizeSpecTitle.new( menu, controller )
	PersonalizeSpecTitle:setLeftRight( true, false, 0, 400 )
	PersonalizeSpecTitle:setTopBottom( true, false, 0, 32 )
	PersonalizeSpecTitle.weaponNameLabel:setText( LocalizeToUpperString( "MENU_NEW" ) )
	self:addElement( PersonalizeSpecTitle )
	self.PersonalizeSpecTitle = PersonalizeSpecTitle
	
	local CurrentlyEquippedInfo = CoD.InfoPaneItemName.new( menu, controller )
	CurrentlyEquippedInfo:setLeftRight( true, false, 0, 400 )
	CurrentlyEquippedInfo:setTopBottom( true, false, 28, 62 )
	CurrentlyEquippedInfo.weaponNameWithVariant.itemName.itemName:setText( Engine.Localize( "WEAPON_AR_STANDARD" ) )
	CurrentlyEquippedInfo.weaponNameWithVariant.variantName.itemName:setText( Engine.Localize( "" ) )
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
	self:addElement( CurrentlyEquippedInfo )
	self.CurrentlyEquippedInfo = CurrentlyEquippedInfo
	
	local CryptokeyTypeNameLeft = CoD.CryptokeyTypeNameLeft.new( menu, controller )
	CryptokeyTypeNameLeft:setLeftRight( true, false, 0, 111 )
	CryptokeyTypeNameLeft:setTopBottom( false, true, 15, 37 )
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
	self:addElement( CryptokeyTypeNameLeft )
	self.CryptokeyTypeNameLeft = CryptokeyTypeNameLeft
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CategoryDesc:completeAnimation()
				self.CategoryDesc:setAlpha( 0 )
				self.clipFinished( CategoryDesc, {} )
			end
		},
		ShowCurrentlyEquippedInfo = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				CategoryDesc:completeAnimation()
				self.CategoryDesc:setAlpha( 1 )
				self.clipFinished( CategoryDesc, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CategoryDesc:close()
		element.PersonalizeSpecTitle:close()
		element.CurrentlyEquippedInfo:close()
		element.CryptokeyTypeNameLeft:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
