-- 685d0af18069681dc164d83f64476a0c
-- This hash is used for caching, delete to decompile the file again

CoD.CybercoreSelectionMulticoreWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreSelectionMulticoreWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.CybercoreSelectionMulticoreWidget )
	self.id = "CybercoreSelectionMulticoreWidget"
	self.soundSet = "CAC"
	self:setLeftRight( true, false, 0, 310 )
	self:setTopBottom( true, false, 0, 140 )
	
	local multicoreIcon = LUI.UIImage.new()
	multicoreIcon:setLeftRight( true, false, 0, 128 )
	multicoreIcon:setTopBottom( true, false, 0, 128 )
	multicoreIcon:setScale( 0.9 )
	multicoreIcon:setImage( RegisterImage( "uie_t7_cp_hud_abilityrig_icon_multicore" ) )
	self:addElement( multicoreIcon )
	self.multicoreIcon = multicoreIcon
	
	local titleText = LUI.UIText.new()
	titleText:setLeftRight( true, false, 122, 295 )
	titleText:setTopBottom( true, false, 13, 38 )
	titleText:setText( Engine.Localize( "FEATURE_MULTICORE" ) )
	titleText:setTTF( "fonts/default.ttf" )
	titleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	titleText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( titleText )
	self.titleText = titleText
	
	local requirementText = LUI.UIText.new()
	requirementText:setLeftRight( true, false, 122, 295 )
	requirementText:setTopBottom( true, false, 37, 56 )
	requirementText:setTTF( "fonts/default.ttf" )
	requirementText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	requirementText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	requirementText:subscribeToGlobalModel( controller, "CybercoreSelectionMenu", "multicoreUnlockLevel", function ( model )
		local multicoreUnlockLevel = Engine.GetModelValue( model )
		if multicoreUnlockLevel then
			requirementText:setText( Engine.Localize( LocalizeToUpperString( LocalizeIntoString( "CPUI_REQUIRES_LEVEL", ToString( multicoreUnlockLevel ) ) ) ) )
		end
	end )
	self:addElement( requirementText )
	self.requirementText = requirementText
	
	local instructionsText = LUI.UIText.new()
	instructionsText:setLeftRight( true, false, 122, 295 )
	instructionsText:setTopBottom( true, false, 56, 72 )
	instructionsText:setAlpha( 0.4 )
	instructionsText:setText( Engine.Localize( "FEATURE_MULTICORE_DESC" ) )
	instructionsText:setTTF( "fonts/default.ttf" )
	instructionsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	instructionsText:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( instructionsText )
	self.instructionsText = instructionsText
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		MulticoreActivated = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				requirementText:completeAnimation()
				self.requirementText:setAlpha( 0 )
				self.clipFinished( requirementText, {} )

				instructionsText:completeAnimation()
				self.instructionsText:setAlpha( 1 )
				self.clipFinished( instructionsText, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "MulticoreActivated",
			condition = function ( menu, element, event )
				return IsMulticoreActivated( controller )
			end
		}
	} )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.requirementText:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
