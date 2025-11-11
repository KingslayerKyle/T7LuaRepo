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
	self:setLeftRight( 0, 0, 0, 1053 )
	self:setTopBottom( 0, 0, 0, 54 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( 0, 1, 0, 0 )
	FEButtonPanel0:setTopBottom( 0, 1, 3, -7 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	FEButtonPanel0:setAlpha( 0.2 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( 0, 1, 0, 0 )
	FETitleNumBrdr0:setTopBottom( 0, 1, 3, -7 )
	FETitleNumBrdr0:setAlpha( 0.5 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( 0, 0, -43, 11 )
	Pixel201000:setTopBottom( 0, 0, 1, 7 )
	Pixel201000:setAlpha( 0 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( 0, 0, -43, 11 )
	Pixel2010000:setTopBottom( 1, 1, -11, -5 )
	Pixel2010000:setAlpha( 0 )
	Pixel2010000:setYRot( -180 )
	Pixel2010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010000 )
	self.Pixel2010000 = Pixel2010000
	
	local Pixel2010001 = LUI.UIImage.new()
	Pixel2010001:setLeftRight( 1, 1, -11, 43 )
	Pixel2010001:setTopBottom( 0, 0, 1, 7 )
	Pixel2010001:setAlpha( 0 )
	Pixel2010001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010001 )
	self.Pixel2010001 = Pixel2010001
	
	local Pixel20100000 = LUI.UIImage.new()
	Pixel20100000:setLeftRight( 1, 1, -11, 43 )
	Pixel20100000:setTopBottom( 1, 1, -11, -5 )
	Pixel20100000:setAlpha( 0 )
	Pixel20100000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100000 )
	self.Pixel20100000 = Pixel20100000
	
	local KillcamText0 = LUI.UITightText.new()
	KillcamText0:setLeftRight( 0.5, 0.5, -516, 516 )
	KillcamText0:setTopBottom( 0, 0, 9, 45 )
	KillcamText0:setAlpha( 0.85 )
	KillcamText0:setText( Engine.Localize( "MP_KILLCAM_CAPS" ) )
	KillcamText0:setTTF( "fonts/FoundryGridnik-Bold.ttf" )
	KillcamText0:setLetterSpacing( 0.5 )
	LUI.OverrideFunction_CallOriginalFirst( KillcamText0, "setText", function ( element, text )
		ScaleWidgetToLabelCentered( self, element, 30 )
	end )
	self:addElement( KillcamText0 )
	self.KillcamText0 = KillcamText0
	
	local GamemodeIcon = LUI.UIImage.new()
	GamemodeIcon:setLeftRight( 0, 0, -140, -18 )
	GamemodeIcon:setTopBottom( 0, 0, -31, 91 )
	GamemodeIcon:subscribeToGlobalModel( controller, "MapInfo", "gameTypeIcon", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			GamemodeIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( GamemodeIcon )
	self.GamemodeIcon = GamemodeIcon
	
	self.resetProperties = function ()
		KillcamText0:completeAnimation()
		KillcamText0:setRGB( 1, 1, 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		VictoryGreen = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				KillcamText0:completeAnimation()
				self.KillcamText0:setRGB( 0, 1, 0 )
				self.clipFinished( KillcamText0, {} )
			end
		},
		DefeatRed = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				KillcamText0:completeAnimation()
				self.KillcamText0:setRGB( 1, 0.03, 0 )
				self.clipFinished( KillcamText0, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.FEButtonPanel0:close()
		self.FETitleNumBrdr0:close()
		self.GamemodeIcon:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

