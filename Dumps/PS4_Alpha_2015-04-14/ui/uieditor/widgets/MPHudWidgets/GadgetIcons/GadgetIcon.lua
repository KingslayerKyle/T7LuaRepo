require( "ui.uieditor.widgets.MPHudWidgets.GadgetIcons.GadgetIconFill" )

CoD.GadgetIcon = InheritFrom( LUI.UIElement )
CoD.GadgetIcon.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.GadgetIcon )
	self.id = "GadgetIcon"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local gadgetImage = LUI.UIImage.new()
	gadgetImage:setLeftRight( true, false, 0, 64 )
	gadgetImage:setTopBottom( true, false, 0, 64 )
	gadgetImage:setRGB( 1, 1, 1 )
	gadgetImage:setAlpha( 0.5 )
	gadgetImage:setImage( RegisterImage( "uie_menu_gadget_armor_64" ) )
	gadgetImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	self:addElement( gadgetImage )
	self.gadgetImage = gadgetImage
	
	local gadgetIconFill = CoD.GadgetIconFill.new( menu, controller )
	gadgetIconFill:setLeftRight( true, false, 0, 64 )
	gadgetIconFill:setTopBottom( false, true, -32, 0 )
	gadgetIconFill:setRGB( 1, 1, 1 )
	gadgetIconFill:setAlpha( 0.5 )
	self:addElement( gadgetIconFill )
	self.gadgetIconFill = gadgetIconFill
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				gadgetImage:completeAnimation()
				self.gadgetImage:setRGB( 1, 1, 1 )
				self.gadgetImage:setAlpha( 0.2 )
				self.clipFinished( gadgetImage, {} )
				gadgetIconFill:completeAnimation()
				self.gadgetIconFill:setRGB( 1, 1, 1 )
				self.gadgetIconFill:setAlpha( 0.75 )
				self.clipFinished( gadgetIconFill, {} )
			end
		},
		LowEnergy = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				local gadgetImageFrame2 = function ( gadgetImage, event )
					if not event.interrupted then
						gadgetImage:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					gadgetImage:setRGB( 1, 1, 1 )
					gadgetImage:setAlpha( 0.2 )
					if event.interrupted then
						self.clipFinished( gadgetImage, event )
					else
						gadgetImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gadgetImage:completeAnimation()
				self.gadgetImage:setRGB( 1, 1, 1 )
				self.gadgetImage:setAlpha( 0.2 )
				gadgetImageFrame2( gadgetImage, {} )
				local gadgetIconFillFrame2 = function ( gadgetIconFill, event )
					if not event.interrupted then
						gadgetIconFill:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
					end
					gadgetIconFill:setRGB( 1, 0, 0 )
					gadgetIconFill:setAlpha( 0.75 )
					if event.interrupted then
						self.clipFinished( gadgetIconFill, event )
					else
						gadgetIconFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				gadgetIconFill:completeAnimation()
				self.gadgetIconFill:setRGB( 1, 1, 1 )
				self.gadgetIconFill:setAlpha( 0.75 )
				gadgetIconFillFrame2( gadgetIconFill, {} )
			end
		}
	}
	self.close = function ( self )
		self.gadgetIconFill:close()
		CoD.GadgetIcon.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

