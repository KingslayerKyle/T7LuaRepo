-- 3c12c298226c3337990cc8449d1efb6f
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_button_HexBlur" )
require( "ui.uieditor.widgets.VehicleHUDs.Buttons.vhud_button_backing_lines" )

CoD.vhud_ms_ButtonWidget = InheritFrom( LUI.UIElement )
CoD.vhud_ms_ButtonWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.vhud_ms_ButtonWidget )
	self.id = "vhud_ms_ButtonWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 86 )
	self:setTopBottom( true, false, 0, 109 )
	self.anyChildUsesUpdateState = true
	
	local vhudbuttonHexBlur = CoD.vhud_button_HexBlur.new( menu, controller )
	vhudbuttonHexBlur:setLeftRight( false, false, -36.5, 36.5 )
	vhudbuttonHexBlur:setTopBottom( false, false, -39, 34 )
	vhudbuttonHexBlur:setAlpha( 0 )
	self:addElement( vhudbuttonHexBlur )
	self.vhudbuttonHexBlur = vhudbuttonHexBlur
	
	local backinglines = CoD.vhud_button_backing_lines.new( menu, controller )
	backinglines:setLeftRight( false, false, -36.5, 36.5 )
	backinglines:setTopBottom( false, false, -39, 34 )
	backinglines:subscribeToGlobalModel( controller, "PerController", "vehicle.bindings.color", function ( model )
		local vehicleBindingsColor = Engine.GetModelValue( model )
		if vehicleBindingsColor then
			backinglines:setRGB( vehicleBindingsColor )
		end
	end )
	self:addElement( backinglines )
	self.backinglines = backinglines
	
	local prompt = LUI.UITightText.new()
	prompt:setLeftRight( false, false, -100, 100 )
	prompt:setTopBottom( false, false, 26.93, 42.93 )
	prompt:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	prompt:setMaterial( LUI.UIImage.GetCachedMaterial( "sw4_2d_uie_font_cached_glow" ) )
	prompt:setShaderVector( 0, 0, 0, 0, 0 )
	prompt:setShaderVector( 1, 0, 0, 0, 0 )
	prompt:setShaderVector( 2, 1, 0, 0, 0 )
	prompt:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	prompt:setLetterSpacing( 0.5 )
	prompt:linkToElementModel( self, "text", true, function ( model )
		local text = Engine.GetModelValue( model )
		if text then
			prompt:setText( Engine.Localize( text ) )
		end
	end )
	self:addElement( prompt )
	self.prompt = prompt
	
	local button0 = LUI.UIImage.new()
	button0:setLeftRight( false, false, -13.67, 13.91 )
	button0:setTopBottom( false, false, -10.5, 15.5 )
	button0:setAlpha( 0.1 )
	button0:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_scanlines_add" ) )
	button0:setShaderVector( 0, 2.91, 0, 0, 0 )
	button0:setShaderVector( 1, 1, 0, 0, 0 )
	button0:setShaderVector( 2, 0.03, 0, 0, 0 )
	self:addElement( button0 )
	self.button0 = button0
	
	local button1 = LUI.UIImage.new()
	button1:setLeftRight( false, false, -13.67, 13.91 )
	button1:setTopBottom( false, false, -11.5, 14.5 )
	button1:setAlpha( 0.15 )
	button1:setZoom( 15 )
	button1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_multiply" ) )
	self:addElement( button1 )
	self.button1 = button1
	
	local button = LUI.UIImage.new()
	button:setLeftRight( false, false, -13.67, 13.91 )
	button:setTopBottom( false, false, -11.5, 14.5 )
	button:setAlpha( 0.65 )
	button:setZoom( 15 )
	button:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( button )
	self.button = button
	
	local bind = LUI.UITightText.new()
	bind:setLeftRight( false, false, -99.88, 100.12 )
	bind:setTopBottom( false, false, -11.5, 14.5 )
	bind:setTTF( "fonts/default.ttf" )
	bind:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	bind:linkToElementModel( self, "bind", true, function ( model )
		local _bind = Engine.GetModelValue( model )
		if _bind then
			bind:setText( Engine.Localize( _bind ) )
		end
	end )
	self:addElement( bind )
	self.bind = bind
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				vhudbuttonHexBlur:completeAnimation()
				self.vhudbuttonHexBlur:setAlpha( 0 )
				self.clipFinished( vhudbuttonHexBlur, {} )
				backinglines:completeAnimation()
				self.backinglines:setAlpha( 1 )
				self.clipFinished( backinglines, {} )
				prompt:completeAnimation()
				self.prompt:setAlpha( 1 )
				self.clipFinished( prompt, {} )
				button0:completeAnimation()
				self.button0:setAlpha( 0.1 )
				self.clipFinished( button0, {} )
				button1:completeAnimation()
				self.button1:setAlpha( 0.15 )
				self.clipFinished( button1, {} )
				button:completeAnimation()
				self.button:setAlpha( 0.65 )
				self.clipFinished( button, {} )
			end
		},
		NotInUse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 6 )
				vhudbuttonHexBlur:completeAnimation()
				self.vhudbuttonHexBlur:setAlpha( 0 )
				self.clipFinished( vhudbuttonHexBlur, {} )
				backinglines:completeAnimation()
				self.backinglines:setAlpha( 0 )
				self.clipFinished( backinglines, {} )
				prompt:completeAnimation()
				self.prompt:setAlpha( 0 )
				self.clipFinished( prompt, {} )
				button0:completeAnimation()
				self.button0:setAlpha( 0 )
				self.clipFinished( button0, {} )
				button1:completeAnimation()
				self.button1:setAlpha( 0 )
				self.clipFinished( button1, {} )
				button:completeAnimation()
				self.button:setAlpha( 0 )
				self.clipFinished( button, {} )
			end
		},
		hideButtonImage = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				button0:completeAnimation()
				self.button0:setAlpha( 0 )
				self.clipFinished( button0, {} )
				button1:completeAnimation()
				self.button1:setAlpha( 0 )
				self.clipFinished( button1, {} )
				button:completeAnimation()
				self.button:setAlpha( 0 )
				self.clipFinished( button, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "NotInUse",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNonEmptyString( element, controller, "text" )
			end
		},
		{
			stateName = "hideButtonImage",
			condition = function ( menu, element, event )
				return IsSelfModelValueNonEmptyString( element, controller, "bind" )
			end
		}
	} )
	self:linkToElementModel( self, "text", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "text"
		} )
	end )
	self:linkToElementModel( self, "bind", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "bind"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.vhudbuttonHexBlur:close()
		element.backinglines:close()
		element.prompt:close()
		element.bind:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

