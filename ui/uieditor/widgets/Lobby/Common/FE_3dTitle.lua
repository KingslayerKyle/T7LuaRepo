-- d74ba4dd9d3f2f66068d779a38481b89
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_TitleLine" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleNumber" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleInternal" )
require( "ui.uieditor.widgets.Lobby.Common.FE_3dTitleHardcoreKicker" )

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
	self:setLeftRight( true, false, 0, 449 )
	self:setTopBottom( true, false, 0, 51 )
	self.anyChildUsesUpdateState = true
	
	local FETitleLineL = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineL:setLeftRight( true, true, 1, 0 )
	FETitleLineL:setTopBottom( false, false, 23, 27 )
	self:addElement( FETitleLineL )
	self.FETitleLineL = FETitleLineL
	
	local FETitleLineU = CoD.FE_TitleLine.new( menu, controller )
	FETitleLineU:setLeftRight( true, true, 1, 0 )
	FETitleLineU:setTopBottom( false, false, -25, -21 )
	self:addElement( FETitleLineU )
	self.FETitleLineU = FETitleLineU
	
	local MPMainSubHeadingContainer0 = CoD.FE_3dTitleNumber.new( menu, controller )
	MPMainSubHeadingContainer0:setLeftRight( true, false, 0, 376 )
	MPMainSubHeadingContainer0:setTopBottom( true, false, 51, 80 )
	MPMainSubHeadingContainer0.FELabelSubHeadingA0.Label0:setRGB( 0.58, 0.64, 0.65 )
	MPMainSubHeadingContainer0.FELabelSubHeadingA0.Label0:setTTF( "fonts/default.ttf" )
	MPMainSubHeadingContainer0:subscribeToGlobalModel( controller, "LobbyRoot", "onlinePlayerCount", function ( model )
		local onlinePlayerCount = Engine.GetModelValue( model )
		if onlinePlayerCount then
			MPMainSubHeadingContainer0:setAlpha( HideIfEmptyString( onlinePlayerCount ) )
		end
	end )
	MPMainSubHeadingContainer0:subscribeToGlobalModel( controller, "LobbyRoot", "onlinePlayerCount", function ( model )
		local onlinePlayerCount = Engine.GetModelValue( model )
		if onlinePlayerCount then
			MPMainSubHeadingContainer0.FELabelSubHeadingA0.Label0:setText( Engine.Localize( onlinePlayerCount ) )
		end
	end )
	self:addElement( MPMainSubHeadingContainer0 )
	self.MPMainSubHeadingContainer0 = MPMainSubHeadingContainer0
	
	local TextBox1 = CoD.FE_3dTitleInternal.new( menu, controller )
	TextBox1:setLeftRight( true, false, -7.38, 603 )
	TextBox1:setTopBottom( true, false, 0, 51 )
	TextBox1:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_feather_blend" ) )
	TextBox1.Label0:setText( Engine.Localize( "MENU_MULTIPLAYER_CAPS" ) )
	self:addElement( TextBox1 )
	self.TextBox1 = TextBox1
	
	local FE3dTitleHardcoreKicker0 = CoD.FE_3dTitleHardcoreKicker.new( menu, controller )
	FE3dTitleHardcoreKicker0:setLeftRight( true, false, 9.2, 125.7 )
	FE3dTitleHardcoreKicker0:setTopBottom( true, false, -13, 3 )
	self:addElement( FE3dTitleHardcoreKicker0 )
	self.FE3dTitleHardcoreKicker0 = FE3dTitleHardcoreKicker0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 4 )

				FETitleLineL:completeAnimation()
				self.FETitleLineL:setRGB( 1, 1, 1 )
				self.clipFinished( FETitleLineL, {} )

				FETitleLineU:completeAnimation()
				self.FETitleLineU:setRGB( 1, 1, 1 )
				self.clipFinished( FETitleLineU, {} )

				MPMainSubHeadingContainer0:completeAnimation()
				self.MPMainSubHeadingContainer0:setRGB( 1, 1, 1 )
				self.clipFinished( MPMainSubHeadingContainer0, {} )

				TextBox1:completeAnimation()
				self.TextBox1:setRGB( 1, 1, 1 )
				self.TextBox1:setAlpha( 0.95 )
				self.clipFinished( TextBox1, {} )
			end,
			Intro = function ()
				self:setupElementClipCounter( 4 )

				local FETitleLineLFrame2 = function ( FETitleLineL, event )
					local FETitleLineLFrame3 = function ( FETitleLineL, event )
						if not event.interrupted then
							FETitleLineL:beginAnimation( "keyframe", 339, false, false, CoD.TweenType.Linear )
						end
						FETitleLineL:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( FETitleLineL, event )
						else
							FETitleLineL:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FETitleLineLFrame3( FETitleLineL, event )
						return 
					else
						FETitleLineL:beginAnimation( "keyframe", 959, false, false, CoD.TweenType.Linear )
						FETitleLineL:registerEventHandler( "transition_complete_keyframe", FETitleLineLFrame3 )
					end
				end
				
				FETitleLineL:completeAnimation()
				self.FETitleLineL:setRGB( 0, 0, 0 )
				FETitleLineLFrame2( FETitleLineL, {} )
				local FETitleLineUFrame2 = function ( FETitleLineU, event )
					local FETitleLineUFrame3 = function ( FETitleLineU, event )
						if not event.interrupted then
							FETitleLineU:beginAnimation( "keyframe", 310, false, false, CoD.TweenType.Linear )
						end
						FETitleLineU:setRGB( 1, 1, 1 )
						if event.interrupted then
							self.clipFinished( FETitleLineU, event )
						else
							FETitleLineU:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						FETitleLineUFrame3( FETitleLineU, event )
						return 
					else
						FETitleLineU:beginAnimation( "keyframe", 680, false, false, CoD.TweenType.Linear )
						FETitleLineU:registerEventHandler( "transition_complete_keyframe", FETitleLineUFrame3 )
					end
				end
				
				FETitleLineU:completeAnimation()
				self.FETitleLineU:setRGB( 0, 0, 0 )
				FETitleLineUFrame2( FETitleLineU, {} )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FETitleLineL:close()
		element.FETitleLineU:close()
		element.MPMainSubHeadingContainer0:close()
		element.TextBox1:close()
		element.FE3dTitleHardcoreKicker0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

