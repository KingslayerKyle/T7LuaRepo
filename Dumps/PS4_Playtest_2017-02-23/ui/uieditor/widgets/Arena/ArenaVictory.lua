require( "ui.uieditor.widgets.HUD.Outcome.Outcome_title_PnlCenter" )
require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )

CoD.ArenaVictory = InheritFrom( LUI.UIElement )
CoD.ArenaVictory.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ArenaVictory )
	self.id = "ArenaVictory"
	self.soundSet = "default"
	self:setLeftRight( 0, 0, 0, 1053 )
	self:setTopBottom( 0, 0, 0, 82 )
	
	local OutcometitlePnlCenter = CoD.Outcome_title_PnlCenter.new( menu, controller )
	OutcometitlePnlCenter:setLeftRight( 0, 1, 0, 0 )
	OutcometitlePnlCenter:setTopBottom( 0, 0, 0, 82 )
	OutcometitlePnlCenter:setRGB( 0.3, 0.3, 0.3 )
	self:addElement( OutcometitlePnlCenter )
	self.OutcometitlePnlCenter = OutcometitlePnlCenter
	
	local TopFrame = LUI.UIImage.new()
	TopFrame:setLeftRight( 0, 1, 0, 0 )
	TopFrame:setTopBottom( 0, 0, 0, 82 )
	TopFrame:setRGB( 0.49, 0.49, 0.49 )
	TopFrame:setAlpha( 0.4 )
	self:addElement( TopFrame )
	self.TopFrame = TopFrame
	
	local CornerFrameLL = LUI.UIImage.new()
	CornerFrameLL:setLeftRight( 0, 0, -41, 0 )
	CornerFrameLL:setTopBottom( 1, 1, -41, 0 )
	CornerFrameLL:setRGB( 0.49, 0.49, 0.49 )
	CornerFrameLL:setAlpha( 0.4 )
	CornerFrameLL:setXRot( 180 )
	CornerFrameLL:setYRot( 180 )
	CornerFrameLL:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( CornerFrameLL )
	self.CornerFrameLL = CornerFrameLL
	
	local CornerFrameUL = LUI.UIImage.new()
	CornerFrameUL:setLeftRight( 0, 0, -41, 0 )
	CornerFrameUL:setTopBottom( 0, 0, 0, 41 )
	CornerFrameUL:setRGB( 0.49, 0.49, 0.49 )
	CornerFrameUL:setAlpha( 0.4 )
	CornerFrameUL:setYRot( 180 )
	CornerFrameUL:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( CornerFrameUL )
	self.CornerFrameUL = CornerFrameUL
	
	local CornerFrameLR = LUI.UIImage.new()
	CornerFrameLR:setLeftRight( 1, 1, 0, 41 )
	CornerFrameLR:setTopBottom( 1, 1, -41, 0 )
	CornerFrameLR:setRGB( 0.49, 0.49, 0.49 )
	CornerFrameLR:setAlpha( 0.4 )
	CornerFrameLR:setXRot( 180 )
	CornerFrameLR:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( CornerFrameLR )
	self.CornerFrameLR = CornerFrameLR
	
	local CornerFrameUR = LUI.UIImage.new()
	CornerFrameUR:setLeftRight( 1, 1, 0, 41 )
	CornerFrameUR:setTopBottom( 0, 0, 0, 41 )
	CornerFrameUR:setRGB( 0.49, 0.49, 0.49 )
	CornerFrameUR:setAlpha( 0.4 )
	CornerFrameUR:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( CornerFrameUR )
	self.CornerFrameUR = CornerFrameUR
	
	local ColorBox = CoD.FE_ButtonPanel.new( menu, controller )
	ColorBox:setLeftRight( 0, 1, 0, 0 )
	ColorBox:setTopBottom( 0, 1, 3, -7 )
	ColorBox:setRGB( 1, 0.43, 0 )
	ColorBox:setAlpha( 0 )
	self:addElement( ColorBox )
	self.ColorBox = ColorBox
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( 0, 0, -43, 11 )
	Pixel201000:setTopBottom( 0, 0, -3, 3 )
	Pixel201000:setAlpha( 0.54 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( 0, 0, -43, 11 )
	Pixel2010000:setTopBottom( 1, 1, -1, 5 )
	Pixel2010000:setAlpha( 0.54 )
	Pixel2010000:setYRot( -180 )
	Pixel2010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010000 )
	self.Pixel2010000 = Pixel2010000
	
	local Pixel2010001 = LUI.UIImage.new()
	Pixel2010001:setLeftRight( 1, 1, -11, 43 )
	Pixel2010001:setTopBottom( 0, 0, -3, 3 )
	Pixel2010001:setAlpha( 0.54 )
	Pixel2010001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010001 )
	self.Pixel2010001 = Pixel2010001
	
	local Pixel20100000 = LUI.UIImage.new()
	Pixel20100000:setLeftRight( 1, 1, -11, 43 )
	Pixel20100000:setTopBottom( 1, 1, -1, 5 )
	Pixel20100000:setAlpha( 0.54 )
	Pixel20100000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100000 )
	self.Pixel20100000 = Pixel20100000
	
	local Grey = LUI.UITightText.new()
	Grey:setLeftRight( 0.5, 0.5, 0, 0 )
	Grey:setTopBottom( 0, 0, 3, 83 )
	Grey:setRGB( ColorSet.Title.r, ColorSet.Title.g, ColorSet.Title.b )
	Grey:setText( Engine.Localize( "MP_VICTORY_CAPS" ) )
	Grey:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Grey:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( Grey, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 30 )
	end )
	self:addElement( Grey )
	self.Grey = Grey
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( 0.5, 0.5, 0, 0 )
	Title:setTopBottom( 0, 0, 3, 83 )
	Title:setRGB( 0.5, 0.51, 0.52 )
	Title:setText( Engine.Localize( "" ) )
	Title:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Title:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( Title, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 30 )
	end )
	self:addElement( Title )
	self.Title = Title
	
	local LineColorRight = LUI.UIImage.new()
	LineColorRight:setLeftRight( 1, 1, 52, 86 )
	LineColorRight:setTopBottom( 0, 1, 38, -38 )
	LineColorRight:setRGB( 0.49, 0.49, 0.49 )
	LineColorRight:setAlpha( 0.4 )
	self:addElement( LineColorRight )
	self.LineColorRight = LineColorRight
	
	local Rightline0 = LUI.UIImage.new()
	Rightline0:setLeftRight( 0, 0, -82, -48 )
	Rightline0:setTopBottom( 0, 1, 39, -39 )
	Rightline0:setRGB( 0.49, 0.49, 0.49 )
	Rightline0:setAlpha( 0.4 )
	self:addElement( Rightline0 )
	self.Rightline0 = Rightline0
	
	self.resetProperties = function ()
		Title:completeAnimation()
		Grey:completeAnimation()
		Title:setRGB( 0.5, 0.51, 0.52 )
		Title:setAlpha( 1 )
		Title:setText( Engine.Localize( "" ) )
		Grey:setAlpha( 1 )
		Grey:setText( Engine.Localize( "MP_VICTORY_CAPS" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.clipFinished( Title, {} )
			end
		},
		Victory = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				Title:completeAnimation()
				self.Title:setRGB( 0.36, 1, 0.15 )
				self.Title:setAlpha( 0.65 )
				self.Title:setText( Engine.Localize( "MP_VICTORY_CAPS" ) )
				self.clipFinished( Title, {} )
			end
		},
		Defeat = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Grey:completeAnimation()
				self.Grey:setText( Engine.Localize( "MP_DEFEAT_CAPS" ) )
				self.clipFinished( Grey, {} )
				Title:completeAnimation()
				self.Title:setRGB( 1, 0.01, 0 )
				self.Title:setAlpha( 0.7 )
				self.Title:setText( Engine.Localize( "MP_DEFEAT_CAPS" ) )
				self.clipFinished( Title, {} )
			end
		},
		Draw = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				Grey:completeAnimation()
				self.Grey:setAlpha( 0 )
				self.clipFinished( Grey, {} )
				Title:completeAnimation()
				self.Title:setRGB( 0.8, 0.8, 0.8 )
				self.Title:setText( Engine.Localize( "MP_DRAW_CAPS" ) )
				self.clipFinished( Title, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Victory",
			condition = function ( menu, element, event )
				return WonLastTeamBasedMatch( controller )
			end
		},
		{
			stateName = "Defeat",
			condition = function ( menu, element, event )
				return LostLastTeamBasedMatch( controller )
			end
		},
		{
			stateName = "Draw",
			condition = function ( menu, element, event )
				return AlwaysTrue()
			end
		}
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.OutcometitlePnlCenter:close()
		self.ColorBox:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

