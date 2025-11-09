require( "ui.uieditor.widgets.CAC.CustomClassGridScreen.ModItemWidget_Internal" )

CoD.ModItemWidget = InheritFrom( LUI.UIElement )
CoD.ModItemWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.ModItemWidget )
	self.id = "ModItemWidget"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 135 )
	self:setTopBottom( true, false, 0, 109 )
	self:makeFocusable()
	self:setHandleMouse( true )
	
	local bgImage = LUI.UIImage.new()
	bgImage:setLeftRight( true, true, 33, -33 )
	bgImage:setTopBottom( true, true, 20, -20 )
	bgImage:setRGB( 0.81, 0.45, 0.45 )
	bgImage:setAlpha( 0 )
	bgImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( bgImage )
	self.bgImage = bgImage
	
	local modItemWidget = CoD.ModItemWidget_Internal.new( menu, controller )
	modItemWidget:setLeftRight( true, false, 0, 135 )
	modItemWidget:setTopBottom( true, false, 0, 109 )
	modItemWidget:setRGB( 1, 1, 1 )
	modItemWidget.nameLabel:setText( Engine.Localize( "MPUI_REFLEX_CAPS" ) )
	self:addElement( modItemWidget )
	self.modItemWidget = modItemWidget
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				bgImage:completeAnimation()
				self.bgImage:setAlpha( 0 )
				self.clipFinished( bgImage, {} )
			end,
			Focus = function ()
				self:setupElementClipCounter( 1 )
				local bgImageFrame2 = function ( bgImage, event )
					if not event.interrupted then
						bgImage:beginAnimation( "keyframe", 300, false, false, CoD.TweenType.Linear )
					end
					bgImage:setRGB( 0.81, 0.45, 0.45 )
					bgImage:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( bgImage, event )
					else
						bgImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				bgImage:completeAnimation()
				self.bgImage:setRGB( 1, 1, 1 )
				self.bgImage:setAlpha( 1 )
				bgImageFrame2( bgImage, {} )
			end
		}
	}
	self.close = function ( self )
		self.modItemWidget:close()
		CoD.ModItemWidget.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

