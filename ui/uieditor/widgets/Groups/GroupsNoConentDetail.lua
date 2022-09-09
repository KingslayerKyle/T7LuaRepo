-- 685cb72c0cc105dfc8900330f9fe16e3
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.BorderBakedSolid" )

CoD.GroupsNoConentDetail = InheritFrom( LUI.UIElement )
CoD.GroupsNoConentDetail.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.GroupsNoConentDetail )
	self.id = "GroupsNoConentDetail"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 268 )
	self:setTopBottom( true, false, 0, 270 )
	self.anyChildUsesUpdateState = true
	
	local Bkgd = LUI.UIImage.new()
	Bkgd:setLeftRight( true, true, 0, 0 )
	Bkgd:setTopBottom( true, true, 0, 0 )
	Bkgd:setRGB( 0.04, 0.04, 0.05 )
	Bkgd:setAlpha( 0.6 )
	self:addElement( Bkgd )
	self.Bkgd = Bkgd
	
	local BorderBakedSolid = CoD.BorderBakedSolid.new( menu, controller )
	BorderBakedSolid:setLeftRight( true, true, -1, 1 )
	BorderBakedSolid:setTopBottom( true, true, -1, 2 )
	self:addElement( BorderBakedSolid )
	self.BorderBakedSolid = BorderBakedSolid
	
	local DescFrame = LUI.UIImage.new()
	DescFrame:setLeftRight( true, true, 12, -12 )
	DescFrame:setTopBottom( true, true, 11.5, -11.5 )
	DescFrame:setAlpha( 0.1 )
	self:addElement( DescFrame )
	self.DescFrame = DescFrame
	
	local HeaderBkgd = LUI.UIImage.new()
	HeaderBkgd:setLeftRight( true, true, 12, -12 )
	HeaderBkgd:setTopBottom( true, false, 12, 34 )
	HeaderBkgd:setRGB( 0.5, 0.67, 0.24 )
	HeaderBkgd:setAlpha( 0.7 )
	self:addElement( HeaderBkgd )
	self.HeaderBkgd = HeaderBkgd
	
	local HeaderIcon = LUI.UIImage.new()
	HeaderIcon:setLeftRight( true, false, 12.5, 34.5 )
	HeaderIcon:setTopBottom( true, false, 12, 34 )
	HeaderIcon:setRGB( 0.03, 0.03, 0.03 )
	HeaderIcon:setImage( RegisterImage( "uie_t7_icon_menu_simple_publish" ) )
	self:addElement( HeaderIcon )
	self.HeaderIcon = HeaderIcon
	
	local Header = LUI.UITightText.new()
	Header:setLeftRight( true, false, 37, 248 )
	Header:setTopBottom( true, false, 8, 36 )
	Header:setRGB( 0, 0, 0 )
	Header:setText( Engine.Localize( "GROUPS_FIND_GROUPS_CAPS" ) )
	Header:setTTF( "fonts/default.ttf" )
	self:addElement( Header )
	self.Header = Header
	
	local Desc = LUI.UIText.new()
	Desc:setLeftRight( true, true, 18, -18 )
	Desc:setTopBottom( true, false, 40, 62 )
	Desc:setRGB( 0.55, 0.55, 0.55 )
	Desc:setText( Engine.Localize( "MENU_FILESHARE_PUBLISH_DESCRIPTION" ) )
	Desc:setTTF( "fonts/default.ttf" )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_LEFT )
	Desc:setAlignment( Enum.LUIAlignment.LUI_ALIGNMENT_TOP )
	self:addElement( Desc )
	self.Desc = Desc
	
	local Glow2 = LUI.UIImage.new()
	Glow2:setLeftRight( true, true, -87.72, 91.72 )
	Glow2:setTopBottom( true, false, -41.21, 87.21 )
	Glow2:setRGB( 0.04, 1, 0 )
	Glow2:setAlpha( 0.8 )
	Glow2:setImage( RegisterImage( "uie_t7_cp_hud_enemytarget_glow" ) )
	Glow2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Glow2 )
	self.Glow2 = Glow2
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				Bkgd:completeAnimation()
				self.Bkgd:setAlpha( 0.6 )
				self.clipFinished( Bkgd, {} )

				BorderBakedSolid:completeAnimation()
				self.BorderBakedSolid:setAlpha( 1 )
				self.clipFinished( BorderBakedSolid, {} )

				DescFrame:completeAnimation()
				self.DescFrame:setAlpha( 0.1 )
				self.clipFinished( DescFrame, {} )

				HeaderBkgd:completeAnimation()
				self.HeaderBkgd:setAlpha( 0.6 )
				self.clipFinished( HeaderBkgd, {} )

				HeaderIcon:completeAnimation()
				self.HeaderIcon:setAlpha( 1 )
				self.clipFinished( HeaderIcon, {} )

				Header:completeAnimation()
				self.Header:setAlpha( 1 )
				self.clipFinished( Header, {} )

				Desc:completeAnimation()
				self.Desc:setRGB( 0.55, 0.55, 0.55 )
				self.Desc:setAlpha( 1 )
				self.clipFinished( Desc, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 1 )
				self.clipFinished( Glow2, {} )
			end
		},
		Hidden = {
			DefaultClip = function ()
				self:setupElementClipCounter( 8 )

				Bkgd:completeAnimation()
				self.Bkgd:setAlpha( 0 )
				self.clipFinished( Bkgd, {} )

				BorderBakedSolid:completeAnimation()
				self.BorderBakedSolid:setAlpha( 0 )
				self.clipFinished( BorderBakedSolid, {} )

				DescFrame:completeAnimation()
				self.DescFrame:setAlpha( 0 )
				self.clipFinished( DescFrame, {} )

				HeaderBkgd:completeAnimation()
				self.HeaderBkgd:setAlpha( 0 )
				self.clipFinished( HeaderBkgd, {} )

				HeaderIcon:completeAnimation()
				self.HeaderIcon:setAlpha( 0 )
				self.clipFinished( HeaderIcon, {} )

				Header:completeAnimation()
				self.Header:setAlpha( 0 )
				self.clipFinished( Header, {} )

				Desc:completeAnimation()
				self.Desc:setAlpha( 0 )
				self.clipFinished( Desc, {} )

				Glow2:completeAnimation()
				self.Glow2:setAlpha( 0 )
				self.clipFinished( Glow2, {} )
			end
		}
	}

	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.BorderBakedSolid:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end
