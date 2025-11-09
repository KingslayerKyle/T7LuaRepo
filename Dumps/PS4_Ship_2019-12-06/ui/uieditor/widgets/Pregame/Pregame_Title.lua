require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.Pregame_Title = InheritFrom( LUI.UIElement )
CoD.Pregame_Title.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Pregame_Title )
	self.id = "Pregame_Title"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 702 )
	self:setTopBottom( true, false, 0, 36 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 0, 0 )
	FEButtonPanel0:setTopBottom( true, true, 2, -5 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.2 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 0, 0 )
	FETitleNumBrdr0:setTopBottom( true, true, 2, -5 )
	FETitleNumBrdr0:setAlpha( 0.5 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( true, false, -29, 7 )
	Pixel201000:setTopBottom( true, false, 1, 5 )
	Pixel201000:setAlpha( 0 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( true, false, -29, 7 )
	Pixel2010000:setTopBottom( false, true, -7, -3 )
	Pixel2010000:setAlpha( 0 )
	Pixel2010000:setYRot( -180 )
	Pixel2010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010000 )
	self.Pixel2010000 = Pixel2010000
	
	local Pixel2010001 = LUI.UIImage.new()
	Pixel2010001:setLeftRight( false, true, -7, 29 )
	Pixel2010001:setTopBottom( true, false, 1, 5 )
	Pixel2010001:setAlpha( 0 )
	Pixel2010001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010001 )
	self.Pixel2010001 = Pixel2010001
	
	local Pixel20100000 = LUI.UIImage.new()
	Pixel20100000:setLeftRight( false, true, -7, 29 )
	Pixel20100000:setTopBottom( false, true, -7, -3 )
	Pixel20100000:setAlpha( 0 )
	Pixel20100000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100000 )
	self.Pixel20100000 = Pixel20100000
	
	local KillcamText0 = LUI.UITightText.new()
	KillcamText0:setLeftRight( false, false, -344, 344 )
	KillcamText0:setTopBottom( true, false, 6, 30 )
	KillcamText0:setAlpha( 0.85 )
	KillcamText0:setText( Engine.Localize( "MP_KILLCAM_CAPS" ) )
	KillcamText0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	KillcamText0:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( KillcamText0, "setText", function ( element, controller )
		ScaleWidgetToLabelCentered( self, element, 30 )
	end )
	self:addElement( KillcamText0 )
	self.KillcamText0 = KillcamText0
	
	local GamemodeIcon = LUI.UIImage.new()
	GamemodeIcon:setLeftRight( true, false, -93, -12 )
	GamemodeIcon:setTopBottom( true, false, -20.5, 60.5 )
	GamemodeIcon:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local gameTypeIcon = Engine.GetModelValue( model )
		if gameTypeIcon then
			GamemodeIcon:setImage( RegisterImage( gameTypeIcon ) )
		end
	end )
	self:addElement( GamemodeIcon )
	self.GamemodeIcon = GamemodeIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				KillcamText0:completeAnimation()
				self.KillcamText0:setLeftRight( false, false, -344, 344 )
				self.KillcamText0:setTopBottom( true, false, 6, 30 )
				self.clipFinished( KillcamText0, {} )
			end
		},
		VictoryGreen = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				KillcamText0:completeAnimation()
				self.KillcamText0:setRGB( 0, 1, 0 )
				self.clipFinished( KillcamText0, {} )
			end
		},
		DefeatRed = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				KillcamText0:completeAnimation()
				self.KillcamText0:setRGB( 1, 0.03, 0 )
				self.clipFinished( KillcamText0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.FETitleNumBrdr0:close()
		element.GamemodeIcon:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

