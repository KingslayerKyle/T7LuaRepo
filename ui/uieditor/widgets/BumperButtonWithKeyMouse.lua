-- 1a960a5853eb4213677e084afb7c48c5
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

local PostLoadFunc = function ( self, controller, menu )
	self:setHandleMouse( true )
end

CoD.BumperButtonWithKeyMouse = InheritFrom( LUI.UIElement )
CoD.BumperButtonWithKeyMouse.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BumperButtonWithKeyMouse )
	self.id = "BumperButtonWithKeyMouse"
	self.soundSet = "MultiplayerMain"
	self:setLeftRight( true, false, 0, 45 )
	self:setTopBottom( true, false, 0, 30 )
	
	local KeyMouseImage = LUI.UIImage.new()
	KeyMouseImage:setLeftRight( true, true, 0, 0 )
	KeyMouseImage:setTopBottom( true, true, 0, 0 )
	KeyMouseImage:setScale( 0.5 )
	KeyMouseImage:setImage( RegisterImage( "uie_bumperleft" ) )
	self:addElement( KeyMouseImage )
	self.KeyMouseImage = KeyMouseImage
	
	local ControllerImage = LUI.UIImage.new()
	ControllerImage:setLeftRight( true, true, 0, 0 )
	ControllerImage:setTopBottom( true, true, 0, 0 )
	ControllerImage:setScale( 0.6 )
	ControllerImage:subscribeToGlobalModel( controller, "Controller", "left_shoulder_button_image", function ( model )
		local leftShoulderButtonImage = Engine.GetModelValue( model )
		if leftShoulderButtonImage then
			ControllerImage:setImage( RegisterImage( leftShoulderButtonImage ) )
		end
	end )
	self:addElement( ControllerImage )
	self.ControllerImage = ControllerImage
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 10.35, -10.35 )
	FETitleNumBrdr0:setTopBottom( true, true, 1.5, -1.5 )
	FETitleNumBrdr0:setAlpha( 0 )
	FETitleNumBrdr0:setScale( 0.9 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				KeyMouseImage:completeAnimation()
				self.KeyMouseImage:setAlpha( 0 )
				self.clipFinished( KeyMouseImage, {} )
				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 1 )
				self.clipFinished( ControllerImage, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end
		},
		KeyMouse = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				KeyMouseImage:completeAnimation()
				self.KeyMouseImage:setRGB( 1, 1, 1 )
				self.KeyMouseImage:setAlpha( 1 )
				self.KeyMouseImage:setScale( 0.5 )
				self.clipFinished( KeyMouseImage, {} )
				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 0 )
				self.clipFinished( ControllerImage, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setLeftRight( true, true, 10.35, -10.35 )
				self.FETitleNumBrdr0:setTopBottom( true, true, 1.5, -1.5 )
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.FETitleNumBrdr0:setScale( 0.9 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end,
			Over = function ()
				self:setupElementClipCounter( 3 )
				KeyMouseImage:completeAnimation()
				self.KeyMouseImage:setRGB( 1, 0.41, 0 )
				self.KeyMouseImage:setScale( 0.5 )
				self.clipFinished( KeyMouseImage, {} )
				ControllerImage:completeAnimation()
				self.ControllerImage:setAlpha( 0 )
				self.clipFinished( ControllerImage, {} )
				FETitleNumBrdr0:completeAnimation()
				self.FETitleNumBrdr0:setLeftRight( true, true, 10.35, -10.35 )
				self.FETitleNumBrdr0:setTopBottom( true, true, 1.5, -1.5 )
				self.FETitleNumBrdr0:setAlpha( 0 )
				self.FETitleNumBrdr0:setScale( 0.9 )
				self.clipFinished( FETitleNumBrdr0, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "KeyMouse",
			condition = function ( menu, element, event )
				return not IsGamepad( controller )
			end
		}
	} )
	if self.m_eventHandlers.input_source_changed then
		local f2_local4 = self.m_eventHandlers.input_source_changed
		self:registerEventHandler( "input_source_changed", function ( element, event )
			event.menu = event.menu or menu
			element:updateState( event )
			return f2_local4( element, event )
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
		element.FETitleNumBrdr0:close()
		element.ControllerImage:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

