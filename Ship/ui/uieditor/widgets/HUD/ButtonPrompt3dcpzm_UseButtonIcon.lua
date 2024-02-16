-- e7f11e70fcd5e11b3c1315ea1a5a34c8
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.HUD.ButtonPrompt3dBind" )

local PostLoadFunc = function ( self, controller, menu )
	self.progressMeter:setShaderVector( 0, -0.05, 0, 0, 0 )
	self.ButtonPrompt3dBindUse.progressMeter:setAlpha( 0 )
	if CoD.isPC and self.ButtonPrompt3dBindUse and self.ButtonPrompt3dBindUse.promptKM then
		local f1_local0 = function ( f2_arg0 )
			if CoD.isPC and f2_arg0 and f2_arg0.promptKM then
				local f2_local0 = 39
				local f2_local1 = 26
				if f2_arg0 == nil then
					return 
				end
				local f2_local2, f2_local3, f2_local4, f2_local5 = f2_arg0:getLocalLeftRight()
				local f2_local6 = math.max( f2_arg0.promptKM:getTextWidth() + f2_local1, f2_local0 )
				f2_arg0:setLeftRight( false, true, f2_local5 - f2_local6, f2_local5 )
				if not IsGamepad( controller ) and f2_local0 < f2_local6 then
					self.progressMeter:setAlpha( 0 )
					f2_arg0.progressMeter:setAlpha( 1 )
				else
					self.progressMeter:setAlpha( 1 )
					f2_arg0.progressMeter:setAlpha( 0 )
				end
			end
		end
		
		self:registerEventHandler( "input_source_changed", function ( element, event )
			f1_local0( element.ButtonPrompt3dBindUse )
		end )
		f1_local0( self.ButtonPrompt3dBindUse )
	end
end

CoD.ButtonPrompt3dcpzm_UseButtonIcon = InheritFrom( LUI.UIElement )
CoD.ButtonPrompt3dcpzm_UseButtonIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.ButtonPrompt3dcpzm_UseButtonIcon )
	self.id = "ButtonPrompt3dcpzm_UseButtonIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 39 )
	self:setTopBottom( true, false, 0, 39 )
	self.anyChildUsesUpdateState = true
	
	local black = LUI.UIImage.new()
	black:setLeftRight( true, false, 0, 39 )
	black:setTopBottom( true, false, 0, 39 )
	black:setRGB( 0, 0, 0 )
	black:setImage( RegisterImage( "uie_t7_icons_blackcircle" ) )
	self:addElement( black )
	self.black = black
	
	local ButtonPrompt3dBindUse = CoD.ButtonPrompt3dBind.new( menu, controller )
	ButtonPrompt3dBindUse:setLeftRight( false, true, -135, 0 )
	ButtonPrompt3dBindUse:setTopBottom( false, false, -19.5, 19.5 )
	ButtonPrompt3dBindUse:linkToElementModel( self, nil, false, function ( model )
		ButtonPrompt3dBindUse:setModel( model, controller )
	end )
	self:addElement( ButtonPrompt3dBindUse )
	self.ButtonPrompt3dBindUse = ButtonPrompt3dBindUse
	
	local UseButtonIcon = LUI.UIImage.new()
	UseButtonIcon:setLeftRight( true, false, 0, 39 )
	UseButtonIcon:setTopBottom( true, false, 0, 39 )
	UseButtonIcon:subscribeToGlobalModel( controller, "Controller", "alt1_button_image", function ( model )
		local alt1ButtonImage = Engine.GetModelValue( model )
		if alt1ButtonImage then
			UseButtonIcon:setImage( RegisterImage( alt1ButtonImage ) )
		end
	end )
	self:addElement( UseButtonIcon )
	self.UseButtonIcon = UseButtonIcon
	
	local progressMeter = LUI.UIImage.new()
	progressMeter:setLeftRight( true, false, -2, 41 )
	progressMeter:setTopBottom( true, false, -2, 41 )
	progressMeter:setImage( RegisterImage( "uie_t7_hud_interact_meter_thick" ) )
	progressMeter:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	progressMeter:setShaderVector( 1, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 2, 0.5, 0, 0, 0 )
	progressMeter:setShaderVector( 3, 0, 0, 0, 0 )
	progressMeter:linkToElementModel( self, "progress", true, function ( model )
		local progress = Engine.GetModelValue( model )
		if progress then
			progressMeter:setShaderVector( 0, CoD.GetVectorComponentFromString( progress, 1 ), CoD.GetVectorComponentFromString( progress, 2 ), CoD.GetVectorComponentFromString( progress, 3 ), CoD.GetVectorComponentFromString( progress, 4 ) )
		end
	end )
	self:addElement( progressMeter )
	self.progressMeter = progressMeter
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				black:completeAnimation()
				self.black:setAlpha( 1 )
				self.clipFinished( black, {} )

				ButtonPrompt3dBindUse:completeAnimation()
				self.ButtonPrompt3dBindUse:setAlpha( 0 )
				self.clipFinished( ButtonPrompt3dBindUse, {} )

				UseButtonIcon:completeAnimation()
				self.UseButtonIcon:setAlpha( 1 )
				self.clipFinished( UseButtonIcon, {} )

				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 1 )
				self.clipFinished( progressMeter, {} )
			end
		},
		KBMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				black:completeAnimation()
				self.black:setAlpha( 0 )
				self.clipFinished( black, {} )

				ButtonPrompt3dBindUse:completeAnimation()
				self.ButtonPrompt3dBindUse:setAlpha( 1 )
				self.clipFinished( ButtonPrompt3dBindUse, {} )

				UseButtonIcon:completeAnimation()
				self.UseButtonIcon:setAlpha( 0 )
				self.clipFinished( UseButtonIcon, {} )

				progressMeter:completeAnimation()
				self.progressMeter:setAlpha( 0 )
				self.clipFinished( progressMeter, {} )
			end
		}
	}

	self:mergeStateConditions( {
		{
			stateName = "KBMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f4_local5 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f4_local5( element, event )
		end )
	else
		self:registerEventHandler( "input_source_changed", LUI.UIElement.updateState )
	end
	self:subscribeToModel( Engine.GetModel( Engine.GetModelForController( controller ), "LastInput" ), function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "LastInput"
		} )
	end )

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.ButtonPrompt3dBindUse:close()
		element.UseButtonIcon:close()
		element.progressMeter:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
