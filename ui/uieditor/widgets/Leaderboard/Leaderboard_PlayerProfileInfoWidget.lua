-- e2b9ff8158b974d21916be012df9dd73
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CallingCards_FrameWidget" )
require( "ui.uieditor.widgets.Lobby.Common.FE_LabelSubHeadingE" )

CoD.Leaderboard_PlayerProfileInfoWidget = InheritFrom( LUI.UIElement )
CoD.Leaderboard_PlayerProfileInfoWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Leaderboard_PlayerProfileInfoWidget )
	self.id = "Leaderboard_PlayerProfileInfoWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 320 )
	self:setTopBottom( true, false, 0, 282 )
	self.anyChildUsesUpdateState = true
	
	local EmblemSpinner = LUI.UIImage.new()
	EmblemSpinner:setLeftRight( true, false, 128, 192 )
	EmblemSpinner:setTopBottom( true, false, 66, 130 )
	EmblemSpinner:setupSpinner()
	self:addElement( EmblemSpinner )
	self.EmblemSpinner = EmblemSpinner
	
	local GamerCardSpinner = LUI.UIImage.new()
	GamerCardSpinner:setLeftRight( true, false, 128, 192 )
	GamerCardSpinner:setTopBottom( true, false, 209.5, 273.5 )
	GamerCardSpinner:setupSpinner()
	self:addElement( GamerCardSpinner )
	self.GamerCardSpinner = GamerCardSpinner
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 0, 320 )
	emblem:setTopBottom( true, false, 0, 196 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local GamerCard = CoD.CallingCards_FrameWidget.new( menu, controller )
	GamerCard:setLeftRight( true, false, 0, 320 )
	GamerCard:setTopBottom( true, false, 201, 282 )
	GamerCard.CardIconFrame:setScale( 0.67 )
	self:addElement( GamerCard )
	self.GamerCard = GamerCard
	
	local GamerTag = CoD.FE_LabelSubHeadingE.new( menu, controller )
	GamerTag:setLeftRight( true, false, 6.5, 311.5 )
	GamerTag:setTopBottom( true, false, 205.5, 228.5 )
	GamerTag.Label0:setText( "" )
	GamerTag.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GamerTag )
	self.GamerTag = GamerTag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				EmblemSpinner:completeAnimation()
				self.EmblemSpinner:setAlpha( 0 )
				self.clipFinished( EmblemSpinner, {} )
				GamerCardSpinner:completeAnimation()
				self.GamerCardSpinner:setAlpha( 0 )
				self.clipFinished( GamerCardSpinner, {} )
				emblem:completeAnimation()
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )
				GamerCard:completeAnimation()
				self.GamerCard:setAlpha( 0 )
				self.clipFinished( GamerCard, {} )
				GamerTag:completeAnimation()
				self.GamerTag:setAlpha( 0 )
				self.clipFinished( GamerTag, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				EmblemSpinner:completeAnimation()
				self.EmblemSpinner:setAlpha( 0 )
				self.clipFinished( EmblemSpinner, {} )
				GamerCardSpinner:completeAnimation()
				self.GamerCardSpinner:setAlpha( 0 )
				self.clipFinished( GamerCardSpinner, {} )
				emblem:completeAnimation()
				self.emblem:setAlpha( 1 )
				self.clipFinished( emblem, {} )
				GamerCard:completeAnimation()
				self.GamerCard:setAlpha( 1 )
				self.clipFinished( GamerCard, {} )
				GamerTag:completeAnimation()
				self.GamerTag:setAlpha( 1 )
				self.clipFinished( GamerTag, {} )
			end
		},
		PCacheBuffer = {
			DefaultClip = function ()
				self:setupElementClipCounter( 5 )
				EmblemSpinner:completeAnimation()
				self.EmblemSpinner:setAlpha( 1 )
				self.clipFinished( EmblemSpinner, {} )
				GamerCardSpinner:completeAnimation()
				self.GamerCardSpinner:setAlpha( 1 )
				self.clipFinished( GamerCardSpinner, {} )
				emblem:completeAnimation()
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )
				GamerCard:completeAnimation()
				self.GamerCard:setAlpha( 0 )
				self.clipFinished( GamerCard, {} )
				GamerTag:completeAnimation()
				self.GamerTag:setAlpha( 1 )
				self.clipFinished( GamerTag, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GamerCard:close()
		element.GamerTag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

