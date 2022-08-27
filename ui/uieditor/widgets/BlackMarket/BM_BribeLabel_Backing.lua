-- 78af15d6e127a0407d8c4856d2b700dd
-- This hash is used for caching, delete to decompile the file again

CoD.BM_BribeLabel_Backing = InheritFrom( LUI.UIElement )
CoD.BM_BribeLabel_Backing.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.BM_BribeLabel_Backing )
	self.id = "BM_BribeLabel_Backing"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 214 )
	self:setTopBottom( true, false, 0, 56 )
	
	local LabelLeft = LUI.UIImage.new()
	LabelLeft:setLeftRight( true, false, 0.25, 40.25 )
	LabelLeft:setTopBottom( false, false, -28, 28 )
	LabelLeft:setImage( RegisterImage( "uie_t7_blackmarket_specialist_bribe_label_left" ) )
	self:addElement( LabelLeft )
	self.LabelLeft = LabelLeft
	
	local LabelMiddle = LUI.UIImage.new()
	LabelMiddle:setLeftRight( true, true, 40.25, -32.25 )
	LabelMiddle:setTopBottom( false, false, -28, 28 )
	LabelMiddle:setImage( RegisterImage( "uie_t7_blackmarket_specialist_bribe_label_middle" ) )
	self:addElement( LabelMiddle )
	self.LabelMiddle = LabelMiddle
	
	local LabelRight = LUI.UIImage.new()
	LabelRight:setLeftRight( false, true, -32.25, -0.25 )
	LabelRight:setTopBottom( false, false, -28, 28 )
	LabelRight:setImage( RegisterImage( "uie_t7_blackmarket_specialist_bribe_label_right" ) )
	self:addElement( LabelRight )
	self.LabelRight = LabelRight
	
	local icon = LUI.UIImage.new()
	icon:setLeftRight( true, false, 27.5, 75.5 )
	icon:setTopBottom( false, false, -21, 27 )
	icon:setImage( RegisterImage( "uie_t7_menu_frontend_blackmarket_breadcrumb_large" ) )
	self:addElement( icon )
	self.icon = icon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 0 )
			end,
			Visible = function ()
				self:setupElementClipCounter( 4 )
				local LabelLeftFrame2 = function ( LabelLeft, event )
					if not event.interrupted then
						LabelLeft:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					LabelLeft:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LabelLeft, event )
					else
						LabelLeft:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LabelLeft:completeAnimation()
				self.LabelLeft:setAlpha( 0 )
				LabelLeftFrame2( LabelLeft, {} )
				local LabelMiddleFrame2 = function ( LabelMiddle, event )
					if not event.interrupted then
						LabelMiddle:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					LabelMiddle:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LabelMiddle, event )
					else
						LabelMiddle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LabelMiddle:completeAnimation()
				self.LabelMiddle:setAlpha( 0 )
				LabelMiddleFrame2( LabelMiddle, {} )
				local LabelRightFrame2 = function ( LabelRight, event )
					if not event.interrupted then
						LabelRight:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					LabelRight:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( LabelRight, event )
					else
						LabelRight:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				LabelRight:completeAnimation()
				self.LabelRight:setAlpha( 0 )
				LabelRightFrame2( LabelRight, {} )
				local iconFrame2 = function ( icon, event )
					if not event.interrupted then
						icon:beginAnimation( "keyframe", 300, true, false, CoD.TweenType.Bounce )
					end
					icon:setAlpha( 1 )
					if event.interrupted then
						self.clipFinished( icon, event )
					else
						icon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				icon:completeAnimation()
				self.icon:setAlpha( 0 )
				iconFrame2( icon, {} )
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

