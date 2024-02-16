-- 7bf12463df6643a8e0ebe1295a8741fb
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.Lobby.Common.FE_ButtonPanel" )
require( "ui.uieditor.widgets.Lobby.Common.FE_TitleNumBrdr" )

CoD.GP_FrameBackgroundt = InheritFrom( LUI.UIElement )
CoD.GP_FrameBackgroundt.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GP_FrameBackgroundt )
	self.id = "GP_FrameBackgroundt"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 349 )
	self:setTopBottom( true, false, 0, 57 )
	
	local FEButtonPanel0 = CoD.FE_ButtonPanel.new( menu, controller )
	FEButtonPanel0:setLeftRight( true, true, 29, -28 )
	FEButtonPanel0:setTopBottom( true, true, 1, -2 )
	FEButtonPanel0:setRGB( 0, 0, 0 )
	self:addElement( FEButtonPanel0 )
	self.FEButtonPanel0 = FEButtonPanel0
	
	local FETitleNumBrdr0 = CoD.FE_TitleNumBrdr.new( menu, controller )
	FETitleNumBrdr0:setLeftRight( true, true, 29, -28 )
	FETitleNumBrdr0:setTopBottom( true, true, 1, -2 )
	self:addElement( FETitleNumBrdr0 )
	self.FETitleNumBrdr0 = FETitleNumBrdr0
	
	local Pixel201000 = LUI.UIImage.new()
	Pixel201000:setLeftRight( true, false, 0, 36 )
	Pixel201000:setTopBottom( true, false, 0, 4 )
	Pixel201000:setAlpha( 0 )
	Pixel201000:setYRot( -180 )
	Pixel201000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel201000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel201000 )
	self.Pixel201000 = Pixel201000
	
	local Pixel2010000 = LUI.UIImage.new()
	Pixel2010000:setLeftRight( true, false, 0, 36 )
	Pixel2010000:setTopBottom( false, true, -4, 0 )
	Pixel2010000:setAlpha( 0 )
	Pixel2010000:setYRot( -180 )
	Pixel2010000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010000 )
	self.Pixel2010000 = Pixel2010000
	
	local Pixel2010001 = LUI.UIImage.new()
	Pixel2010001:setLeftRight( false, true, -36, 0 )
	Pixel2010001:setTopBottom( true, false, 0, 4 )
	Pixel2010001:setAlpha( 0 )
	Pixel2010001:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel2010001:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel2010001 )
	self.Pixel2010001 = Pixel2010001
	
	local Pixel20100000 = LUI.UIImage.new()
	Pixel20100000:setLeftRight( false, true, -36, 0 )
	Pixel20100000:setTopBottom( false, true, -4, 0 )
	Pixel20100000:setAlpha( 0 )
	Pixel20100000:setImage( RegisterImage( "uie_t7_menu_frontend_pixelist" ) )
	Pixel20100000:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Pixel20100000 )
	self.Pixel20100000 = Pixel20100000
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Content = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		LootBonusDecal = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		LootBonusCallingCard = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		RecentGameBookmarked = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		Fileshare = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		},
		InvitePopup = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.FEButtonPanel0:close()
		element.FETitleNumBrdr0:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
