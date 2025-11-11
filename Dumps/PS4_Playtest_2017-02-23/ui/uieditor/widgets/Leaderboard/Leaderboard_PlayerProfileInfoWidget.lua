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
	self:setLeftRight( 0, 0, 0, 480 )
	self:setTopBottom( 0, 0, 0, 423 )
	self.anyChildUsesUpdateState = true
	
	local EmblemSpinner = LUI.UIImage.new()
	EmblemSpinner:setLeftRight( 0, 0, 192, 288 )
	EmblemSpinner:setTopBottom( 0, 0, 99, 195 )
	EmblemSpinner:setupSpinner()
	self:addElement( EmblemSpinner )
	self.EmblemSpinner = EmblemSpinner
	
	local GamerCardSpinner = LUI.UIImage.new()
	GamerCardSpinner:setLeftRight( 0, 0, 192, 288 )
	GamerCardSpinner:setTopBottom( 0, 0, 314, 410 )
	GamerCardSpinner:setupSpinner()
	self:addElement( GamerCardSpinner )
	self.GamerCardSpinner = GamerCardSpinner
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( 0, 0, 0, 480 )
	emblem:setTopBottom( 0, 0, 0, 294 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local GamerCard = CoD.CallingCards_FrameWidget.new( menu, controller )
	GamerCard:setLeftRight( 0, 0, 0, 480 )
	GamerCard:setTopBottom( 0, 0, 301, 423 )
	GamerCard.CardIconFrame:setScale( 0.67 )
	self:addElement( GamerCard )
	self.GamerCard = GamerCard
	
	local GamerTag = CoD.FE_LabelSubHeadingE.new( menu, controller )
	GamerTag:setLeftRight( 0, 0, 9, 467 )
	GamerTag:setTopBottom( 0, 0, 309, 343 )
	GamerTag.Label0:setText( Engine.Localize( "Hendricks" ) )
	GamerTag.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GamerTag )
	self.GamerTag = GamerTag
	
	self.resetProperties = function ()
		emblem:completeAnimation()
		GamerTag:completeAnimation()
		GamerCard:completeAnimation()
		EmblemSpinner:completeAnimation()
		GamerCardSpinner:completeAnimation()
		emblem:setAlpha( 1 )
		GamerTag:setAlpha( 1 )
		GamerCard:setAlpha( 1 )
		EmblemSpinner:setAlpha( 1 )
		GamerCardSpinner:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
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
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				EmblemSpinner:completeAnimation()
				self.EmblemSpinner:setAlpha( 0 )
				self.clipFinished( EmblemSpinner, {} )
				GamerCardSpinner:completeAnimation()
				self.GamerCardSpinner:setAlpha( 0 )
				self.clipFinished( GamerCardSpinner, {} )
			end
		},
		PCacheBuffer = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				emblem:completeAnimation()
				self.emblem:setAlpha( 0 )
				self.clipFinished( emblem, {} )
				GamerCard:completeAnimation()
				self.GamerCard:setAlpha( 0 )
				self.clipFinished( GamerCard, {} )
			end
		}
	}
	GamerCard.id = "GamerCard"
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.GamerCard:close()
		self.GamerTag:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

