require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleHardcoreKicker" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleNumber" )

CoD.FE_3dTitle = InheritFrom( LUI.UIElement )
CoD.FE_3dTitle.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.FE_3dTitle )
	self.id = "FE_3dTitle"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 673 )
	self:setTopBottom( 0, 0, 0, 76 )
	self.anyChildUsesUpdateState = true
	
	local MPMainSubHeadingContainer0 = CoD.FE_3dTitleNumber.new( menu, controller )
	MPMainSubHeadingContainer0:setLeftRight( 0, 0, 0, 564 )
	MPMainSubHeadingContainer0:setTopBottom( 0, 0, 76, 120 )
	MPMainSubHeadingContainer0.FELabelSubHeadingA0.Label0:setRGB( 0.58, 0.64, 0.65 )
	MPMainSubHeadingContainer0.FELabelSubHeadingA0.Label0:setTTF( "fonts/default.ttf" )
	MPMainSubHeadingContainer0:subscribeToGlobalModel( controller, "LobbyRoot", "onlinePlayerCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MPMainSubHeadingContainer0:setAlpha( HideIfEmptyString( modelValue ) )
		end
	end )
	MPMainSubHeadingContainer0:subscribeToGlobalModel( controller, "LobbyRoot", "onlinePlayerCount", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			MPMainSubHeadingContainer0.FELabelSubHeadingA0.Label0:setText( Engine.Localize( modelValue ) )
		end
	end )
	self:addElement( MPMainSubHeadingContainer0 )
	self.MPMainSubHeadingContainer0 = MPMainSubHeadingContainer0
	
	local TextBox1 = CoD.FE_3dTitleInternal.new( menu, controller )
	TextBox1:setLeftRight( 0, 0, -11, 905 )
	TextBox1:setTopBottom( 0, 0, 0, 76 )
	TextBox1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local FE3dTitleHardcoreKicker0 = CoD.FE_3dTitleHardcoreKicker.new( menu, controller )
	FE3dTitleHardcoreKicker0:setLeftRight( 0, 0, 14, 189 )
	FE3dTitleHardcoreKicker0:setTopBottom( 0, 0, -20, 4 )
	self:addElement( FE3dTitleHardcoreKicker0 )
	self.FE3dTitleHardcoreKicker0 = FE3dTitleHardcoreKicker0
	
	self.resetProperties = function ()
		TextBox1:completeAnimation()
		MPMainSubHeadingContainer0:completeAnimation()
		TextBox1:setRGB( 1, 1, 1 )
		TextBox1:setAlpha( 1 )
		MPMainSubHeadingContainer0:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				TextBox1:completeAnimation()
				self.TextBox1:setAlpha( 0.95 )
				self.clipFinished( TextBox1, {} )
			end,
			Intro = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				local MPMainSubHeadingContainer0Frame2 = function ( MPMainSubHeadingContainer0, event )
					local MPMainSubHeadingContainer0Frame3 = function ( MPMainSubHeadingContainer0, event )
						if not event.interrupted then
							MPMainSubHeadingContainer0:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
						end
						MPMainSubHeadingContainer0:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( MPMainSubHeadingContainer0, event )
						else
							MPMainSubHeadingContainer0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						MPMainSubHeadingContainer0Frame3( MPMainSubHeadingContainer0, event )
						return 
					else
						MPMainSubHeadingContainer0:beginAnimation( "keyframe", 1019, false, false, CoD.TweenType.Linear )
						MPMainSubHeadingContainer0:registerEventHandler( "transition_complete_keyframe", MPMainSubHeadingContainer0Frame3 )
					end
				end
				
				MPMainSubHeadingContainer0:completeAnimation()
				self.MPMainSubHeadingContainer0:setRGB( 0, 0, 0 )
				MPMainSubHeadingContainer0Frame2( MPMainSubHeadingContainer0, {} )
				local TextBox1Frame2 = function ( TextBox1, event )
					local TextBox1Frame3 = function ( TextBox1, event )
						if not event.interrupted then
							TextBox1:beginAnimation( "keyframe", 320, false, false, CoD.TweenType.Linear )
						end
						TextBox1:setRGB( 1, 1, 1 )
						TextBox1:setAlpha( 0.95 )
						if event.interrupted then
							self.clipFinished( TextBox1, event )
						else
							TextBox1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						TextBox1Frame3( TextBox1, event )
						return 
					else
						TextBox1:beginAnimation( "keyframe", 409, false, false, CoD.TweenType.Linear )
						TextBox1:registerEventHandler( "transition_complete_keyframe", TextBox1Frame3 )
					end
				end
				
				TextBox1:completeAnimation()
				self.TextBox1:setRGB( 0, 0, 0 )
				self.TextBox1:setAlpha( 0.95 )
				TextBox1Frame2( TextBox1, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.MPMainSubHeadingContainer0:close()
		self.TextBox1:close()
		self.FE3dTitleHardcoreKicker0:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

