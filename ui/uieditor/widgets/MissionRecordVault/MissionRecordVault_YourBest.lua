-- ca176f7a5864f8f6e40d634a2c1f80e4
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CPLevels.CPFrame" )

CoD.MissionRecordVault_YourBest = InheritFrom( LUI.UIElement )
CoD.MissionRecordVault_YourBest.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.MissionRecordVault_YourBest )
	self.id = "MissionRecordVault_YourBest"
	self.soundSet = "CAC_PrimaryWeapon"
	self:setLeftRight( true, false, 0, 128 )
	self:setTopBottom( true, false, 0, 64 )
	self.anyChildUsesUpdateState = true
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, 0, 128 )
	Image1:setTopBottom( true, false, 0, 22.5 )
	Image1:setRGB( 0.68, 0.68, 0.68 )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local title = LUI.UIText.new()
	title:setLeftRight( true, false, 0, 128 )
	title:setTopBottom( true, false, 0, 22.5 )
	title:setRGB( 0, 0, 0 )
	title:setText( Engine.Localize( "CPUI_YOUR_BEST" ) )
	title:setTTF( "fonts/default.ttf" )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	title:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( title )
	self.title = title
	
	local value = LUI.UIText.new()
	value:setLeftRight( true, false, 6.5, 120.5 )
	value:setTopBottom( true, false, 32, 57 )
	value:setText( Engine.Localize( "MENU_NEW" ) )
	value:setTTF( "fonts/default.ttf" )
	value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_CENTER )
	value:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( value )
	self.value = value
	
	local CPFrame0 = CoD.CPFrame.new( menu, controller )
	CPFrame0:setLeftRight( true, false, 0, 128 )
	CPFrame0:setTopBottom( true, false, 0, 64 )
	self:addElement( CPFrame0 )
	self.CPFrame0 = CPFrame0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		NoAccolades = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				value:completeAnimation()
				self.value:setAlpha( 0 )
				self.clipFinished( value, {} )
			end
		},
		Incomplete = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Image1:completeAnimation()
				self.Image1:setRGB( 0.75, 0.75, 0.75 )
				self.clipFinished( Image1, {} )

				value:completeAnimation()
				self.value:setRGB( 1, 1, 1 )
				self.value:setAlpha( 0 )
				self.clipFinished( value, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "NoAccolades",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "challengeImage" )
			end
		},
		{
			stateName = "Incomplete",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "completed" )
			end
		}
	} )
	self:linkToElementModel( self, "challengeImage", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "challengeImage"
		} )
	end )
	self:linkToElementModel( self, "completed", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "completed"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CPFrame0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
