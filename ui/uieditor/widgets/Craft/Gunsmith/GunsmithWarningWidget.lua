-- 47d4211727b9e7f748ff9b531767bcc7
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.SystemOverlays.systemOverlay_Layout_ForegroundMultilineText" )

CoD.GunsmithWarningWidget = InheritFrom( LUI.UIElement )
CoD.GunsmithWarningWidget.new = function ( menu, controller )
	local self = LUI.UIHorizontalList.new( {
		left = 0,
		top = 0,
		right = 0,
		bottom = 0,
		leftAnchor = true,
		topAnchor = true,
		rightAnchor = true,
		bottomAnchor = true,
		spacing = 4
	} )
	self:setAlignment( LUI.Alignment.Left )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.GunsmithWarningWidget )
	self.id = "GunsmithWarningWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 703 )
	self:setTopBottom( true, false, 0, 24 )
	
	local warningImage = LUI.UIImage.new()
	warningImage:setLeftRight( true, false, 0, 24 )
	warningImage:setTopBottom( true, false, 0, 24 )
	warningImage:setRGB( 1, 0, 0 )
	warningImage:setImage( RegisterImage( "uie_t7_icon_error_overlays" ) )
	self:addElement( warningImage )
	self.warningImage = warningImage
	
	local warningMsg = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	warningMsg:setLeftRight( true, false, 28, 638 )
	warningMsg:setTopBottom( true, false, 0, 24 )
	warningMsg:setRGB( 1, 0, 0 )
	warningMsg.text:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( warningMsg )
	self.warningMsg = warningMsg
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				warningImage:completeAnimation()
				self.warningImage:setAlpha( 1 )
				self.clipFinished( warningImage, {} )
				warningMsg:completeAnimation()
				self.warningMsg:setAlpha( 1 )
				self.clipFinished( warningMsg, {} )
			end
		},
		Hide = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				warningImage:completeAnimation()
				self.warningImage:setAlpha( 0 )
				self.clipFinished( warningImage, {} )
				warningMsg:completeAnimation()
				self.warningMsg:setAlpha( 0 )
				self.clipFinished( warningMsg, {} )
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.warningMsg:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

