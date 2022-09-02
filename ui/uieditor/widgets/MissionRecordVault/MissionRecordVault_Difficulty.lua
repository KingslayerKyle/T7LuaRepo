-- df673cdad6be7ee8ba12c6c534bf0948
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderThin" )

CoD.MissionRecordVault_Difficulty = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_Difficulty.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_Difficulty )
	self.id = "MissionRecordVault_Difficulty"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 353 )
	self:setTopBottom( true, false, 0, 121 )
	self.anyChildUsesUpdateState = true
	
	local BorderThinKills00 = CoD.BorderThin.new( menu, controller )
	BorderThinKills00:setLeftRight( true, false, 0, 352.72 )
	BorderThinKills00:setTopBottom( true, false, 0, 120.56 )
	self:addElement( BorderThinKills00 )
	self.BorderThinKills00 = BorderThinKills00
	
	local DifficultyImage = LUI.UIImage.new()
	DifficultyImage:setLeftRight( true, false, 118.86, 233.86 )
	DifficultyImage:setTopBottom( true, false, 2.78, 117.78 )
	DifficultyImage:subscribeToGlobalModel( controller, "MissionRecordVaultMapInfo", "HIGHEST_DIFFICULTY", function ( model )
		local HIGHEST_DIFFICULTY = Engine.GetModelValue( model )
		if HIGHEST_DIFFICULTY then
			DifficultyImage:setImage( RegisterImage( DifficultyIconFromNumber( HIGHEST_DIFFICULTY ) ) )
		end
	end )
	self:addElement( DifficultyImage )
	self.DifficultyImage = DifficultyImage
	
	local TextBox0 = LUI.UIText.new()
	TextBox0:setLeftRight( true, false, 76.5, 276.5 )
	TextBox0:setTopBottom( true, false, 50.28, 68.28 )
	TextBox0:setText( Engine.Localize( LocalizeToUpperString( "CPUI_NOT_APPLICABLE" ) ) )
	TextBox0:setTTF( "fonts/escom.ttf" )
	TextBox0:setLetterSpacing( 2 )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( TextBox0 )
	self.TextBox0 = TextBox0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 0 )
				self.clipFinished( TextBox0, {} )
			end
		},
		MissionIncomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				DifficultyImage:completeAnimation()
				self.DifficultyImage:setAlpha( 0 )
				self.clipFinished( DifficultyImage, {} )

				TextBox0:completeAnimation()
				self.TextBox0:setAlpha( 1 )
				self.TextBox0:setText( Engine.Localize( LocalizeToUpperString( "CPUI_NOT_APPLICABLE" ) ) )
				self.TextBox0:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
				self.clipFinished( TextBox0, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "MissionIncomplete",
			condition = function ( menu, element, event )
				return IsGlobalModelValueEqualTo( element, controller, "MissionRecordVaultMapInfo.HIGHEST_DIFFICULTY", -1 )
			end
		}
	} )
	self:subscribeToModel( Engine.GetModel( Engine.GetGlobalModel(), "MissionRecordVaultMapInfo.HIGHEST_DIFFICULTY" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "MissionRecordVaultMapInfo.HIGHEST_DIFFICULTY"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderThinKills00:close()
		element.DifficultyImage:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

