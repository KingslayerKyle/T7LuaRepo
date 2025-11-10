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
	
	local emblem = LUI.UIImage.new()
	emblem:setLeftRight( true, false, 0, 320 )
	emblem:setTopBottom( true, false, 0, 196 )
	self:addElement( emblem )
	self.emblem = emblem
	
	local GamerCard = LUI.UIImage.new()
	GamerCard:setLeftRight( true, false, 0, 320 )
	GamerCard:setTopBottom( true, false, 201, 281 )
	self:addElement( GamerCard )
	self.GamerCard = GamerCard
	
	local GamerTag = CoD.FE_LabelSubHeadingE.new( menu, controller )
	GamerTag:setLeftRight( true, false, 6.5, 311.5 )
	GamerTag:setTopBottom( true, false, 205.5, 228.5 )
	GamerTag.Label0:setText( Engine.Localize( "Hendricks" ) )
	GamerTag.Label0:setTTF( "fonts/RefrigeratorDeluxe-Regular.ttf" )
	self:addElement( GamerTag )
	self.GamerTag = GamerTag
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
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
				self:setupElementClipCounter( 3 )
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
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.GamerTag:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

