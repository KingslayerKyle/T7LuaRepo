-- 6ef31a3ba2bea346107478f04635f4e6
-- This hash is used for caching, delete to decompile the file again

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
	self:setLeftRight( true, false, 0, 702 )
	self:setTopBottom( true, false, 0, 55 )
	self.anyChildUsesUpdateState = true
	
	local OutcometitlePnlCenter = CoD.Outcome_title_PnlCenter.new( menu, controller )
	OutcometitlePnlCenter:setLeftRight( true, true, 0, 0 )
	OutcometitlePnlCenter:setTopBottom( true, false, 0, 54.9 )
	OutcometitlePnlCenter:setRGB( 0.3, 0.3, 0.3 )
	self:addElement( OutcometitlePnlCenter )
	self.OutcometitlePnlCenter = OutcometitlePnlCenter
	
	local TopFrame = LUI.UIImage.new()
	TopFrame:setLeftRight( true, true, 0, 0 )
	TopFrame:setTopBottom( true, false, 0, 54.9 )
	TopFrame:setRGB( 0.49, 0.49, 0.49 )
	TopFrame:setAlpha( 0.4 )
	self:addElement( TopFrame )
	self.TopFrame = TopFrame
	
	local CornerFrameLL = LUI.UIImage.new()
	CornerFrameLL:setLeftRight( true, false, -27.5, 0 )
	CornerFrameLL:setTopBottom( false, true, -27.5, 0 )
	CornerFrameLL:setRGB( 0.49, 0.49, 0.49 )
	CornerFrameLL:setAlpha( 0.4 )
	CornerFrameLL:setXRot( 180 )
	CornerFrameLL:setYRot( 180 )
	CornerFrameLL:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( CornerFrameLL )
	self.CornerFrameLL = CornerFrameLL
	
	local CornerFrameUL = LUI.UIImage.new()
	CornerFrameUL:setLeftRight( true, false, -27.5, 0 )
	CornerFrameUL:setTopBottom( true, false, 0, 27.5 )
	CornerFrameUL:setRGB( 0.49, 0.49, 0.49 )
	CornerFrameUL:setAlpha( 0.4 )
	CornerFrameUL:setYRot( 180 )
	CornerFrameUL:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( CornerFrameUL )
	self.CornerFrameUL = CornerFrameUL
	
	local CornerFrameLR = LUI.UIImage.new()
	CornerFrameLR:setLeftRight( false, true, 0, 27.5 )
	CornerFrameLR:setTopBottom( false, true, -27.5, 0 )
	CornerFrameLR:setRGB( 0.49, 0.49, 0.49 )
	CornerFrameLR:setAlpha( 0.4 )
	CornerFrameLR:setXRot( 180 )
	CornerFrameLR:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( CornerFrameLR )
	self.CornerFrameLR = CornerFrameLR
	
	local CornerFrameUR = LUI.UIImage.new()
	CornerFrameUR:setLeftRight( false, true, 0, 27.5 )
	CornerFrameUR:setTopBottom( true, false, 0, 27.5 )
	CornerFrameUR:setRGB( 0.49, 0.49, 0.49 )
	CornerFrameUR:setAlpha( 0.4 )
	CornerFrameUR:setImage( RegisterImage( "uie_t7_hud_mp_notifications_endgame_framecorner" ) )
	self:addElement( CornerFrameUR )
	self.CornerFrameUR = CornerFrameUR
	
	local ColorBox = CoD.FE_ButtonPanel.new( menu, controller )
	ColorBox:setLeftRight( true, true, 0, 0 )
	ColorBox:setTopBottom( true, true, 2, -5 )
	ColorBox:setRGB( 1, 0.43, 0 )
	ColorBox:setAlpha( 0 )
	self:addElement( ColorBox )
	self.ColorBox = ColorBox
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( true, false, -29, 7 )
	Pixel201000:setTopBottom( true, false, -2, 2 )
	Pixel201000:setAlpha( 0.54 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( true, false, -29, 7 )
	Pixel2010000:setTopBottom( false, true, -1, 3 )
	Pixel2010000:setAlpha( 0.54 )
	Pixel2010000:setYRot( -180 )
	Pixel2010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010000 )
	self.Pixel2010000 = Pixel2010000
	
	local Pixel2010001 = LUI.UIImage.new()
	Pixel2010001:setLeftRight( false, true, -7, 29 )
	Pixel2010001:setTopBottom( true, false, -2, 2 )
	Pixel2010001:setAlpha( 0.54 )
	Pixel2010001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010001 )
	self.Pixel2010001 = Pixel2010001
	
	local Pixel20100000 = LUI.UIImage.new()
	Pixel20100000:setLeftRight( false, true, -7, 29 )
	Pixel20100000:setTopBottom( false, true, -1, 3 )
	Pixel20100000:setAlpha( 0.54 )
	Pixel20100000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100000 )
	self.Pixel20100000 = Pixel20100000
	
	local Grey = LUI.UITightText.new()
	Grey:setLeftRight( false, false, 0, 0 )
	Grey:setTopBottom( true, false, 2, 55 )
	Grey:setRGB( ColorSet.Title.r, ColorSet.Title.g, ColorSet.Title.b )
	Grey:setText( Engine.Localize( "MP_VICTORY_CAPS" ) )
	Grey:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Grey:setLetterSpacing( 0.5 )

	LUI.OverrideFunction_CallOriginalFirst( Grey, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 30 )
	end )
	self:addElement( Grey )
	self.Grey = Grey
	
	local Title = LUI.UITightText.new()
	Title:setLeftRight( false, false, 0, 0 )
	Title:setTopBottom( true, false, 2, 55 )
	Title:setRGB( 0.5, 0.51, 0.52 )
	Title:setText( Engine.Localize( "" ) )
	Title:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	Title:setLetterSpacing( 0.5 )

	LUI.OverrideFunction_CallOriginalFirst( Title, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 30 )
	end )
	self:addElement( Title )
	self.Title = Title
	
	local LineColorRight = LUI.UIImage.new()
	LineColorRight:setLeftRight( false, true, 34.5, 57.5 )
	LineColorRight:setTopBottom( true, true, 25.28, -25.28 )
	LineColorRight:setRGB( 0.49, 0.49, 0.49 )
	LineColorRight:setAlpha( 0.4 )
	self:addElement( LineColorRight )
	self.LineColorRight = LineColorRight
	
	local Rightline0 = LUI.UIImage.new()
	Rightline0:setLeftRight( true, false, -55, -32 )
	Rightline0:setTopBottom( true, true, 25.77, -25.77 )
	Rightline0:setRGB( 0.49, 0.49, 0.49 )
	Rightline0:setAlpha( 0.4 )
	self:addElement( Rightline0 )
	self.Rightline0 = Rightline0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				Title:completeAnimation()
				self.Title:setAlpha( 0 )
				self.Title:setText( Engine.Localize( "" ) )
				self.clipFinished( Title, {} )
			end
		},
		Victory = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				Grey:completeAnimation()
				self.Grey:setText( Engine.Localize( "MP_VICTORY_CAPS" ) )
				self.clipFinished( Grey, {} )

				Title:completeAnimation()
				self.Title:setRGB( 0.36, 1, 0.15 )
				self.Title:setAlpha( 0.65 )
				self.Title:setText( Engine.Localize( "MP_VICTORY_CAPS" ) )
				self.clipFinished( Title, {} )
			end
		},
		Defeat = {
			DefaultClip = function ()
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
				self:setupElementClipCounter( 2 )

				Grey:completeAnimation()
				self.Grey:setAlpha( 0 )
				self.clipFinished( Grey, {} )

				Title:completeAnimation()
				self.Title:setRGB( 0.8, 0.8, 0.8 )
				self.Title:setAlpha( 1 )
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

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.OutcometitlePnlCenter:close()
		element.ColorBox:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

