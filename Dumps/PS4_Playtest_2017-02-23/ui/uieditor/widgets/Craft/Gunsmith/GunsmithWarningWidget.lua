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
	self:setLeftRight( 0, 0, 0, 1054 )
	self:setTopBottom( 0, 0, 0, 36 )
	
	local warningImage = LUI.UIImage.new()
	warningImage:setLeftRight( 0, 0, 0, 36 )
	warningImage:setTopBottom( 0, 0, 0, 36 )
	warningImage:setRGB( 1, 0, 0 )
	warningImage:setImage( RegisterImage( "t7_icon_error_overlays" ) )
	self:addElement( warningImage )
	self.warningImage = warningImage
	
	local warningMsg = CoD.systemOverlay_Layout_ForegroundMultilineText.new( menu, controller )
	warningMsg:setLeftRight( 0, 0, 42, 957 )
	warningMsg:setTopBottom( 0, 0, 0, 36 )
	warningMsg:setRGB( 1, 0, 0 )
	warningMsg.text:setText( Engine.Localize( "MENU_NEW" ) )
	self:addElement( warningMsg )
	self.warningMsg = warningMsg
	
	self.resetProperties = function ()
		warningMsg:completeAnimation()
		warningImage:completeAnimation()
		warningMsg:setAlpha( 1 )
		warningImage:setAlpha( 1 )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		Hide = {
			DefaultClip = function ()
				self.resetProperties()
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
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( self )
		self.warningMsg:close()
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

