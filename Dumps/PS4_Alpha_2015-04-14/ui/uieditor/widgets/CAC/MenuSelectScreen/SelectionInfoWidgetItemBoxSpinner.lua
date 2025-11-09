CoD.SelectionInfoWidgetItemBoxSpinner = InheritFrom( LUI.UIElement )
CoD.SelectionInfoWidgetItemBoxSpinner.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.SelectionInfoWidgetItemBoxSpinner )
	self.id = "SelectionInfoWidgetItemBoxSpinner"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 59 )
	self:setTopBottom( true, false, 0, 59 )
	
	local Image2 = LUI.UIImage.new()
	Image2:setLeftRight( true, true, -0.5, 0.5 )
	Image2:setTopBottom( true, true, -0.5, 0.5 )
	Image2:setZRot( 211.5 )
	Image2:setImage( RegisterImage( "uie_img_t7_menu_cacselection_itemboxspinner" ) )
	Image2:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image2 )
	self.Image2 = Image2
	
	local Image1 = LUI.UIImage.new()
	Image1:setLeftRight( true, false, -126.5, -106.5 )
	Image1:setTopBottom( true, false, 22.5, 38.5 )
	Image1:setRGB( 0.32, 0.42, 0.57 )
	Image1:setAlpha( 0 )
	Image1:setZRot( 90 )
	Image1:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tabafocusarrow" ) )
	Image1:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image1 )
	self.Image1 = Image1
	
	local Image0 = LUI.UIImage.new()
	Image0:setLeftRight( true, false, 164.94, 184.94 )
	Image0:setTopBottom( true, false, 38.5, 22.5 )
	Image0:setRGB( 0.32, 0.42, 0.57 )
	Image0:setAlpha( 0 )
	Image0:setZRot( 90 )
	Image0:setImage( RegisterImage( "uie_img_t7_menu_cacselection_tabafocusarrow" ) )
	Image0:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	self:addElement( Image0 )
	self.Image0 = Image0
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				local Image2Frame2 = function ( Image2, event )
					if not event.interrupted then
						Image2:beginAnimation( "keyframe", 4000, false, false, CoD.TweenType.Linear )
					end
					Image2:setZRot( 360 )
					if event.interrupted then
						self.clipFinished( Image2, event )
					else
						Image2:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				Image2:completeAnimation()
				self.Image2:setZRot( 0 )
				Image2Frame2( Image2, {} )
				local Image1Frame2 = function ( Image1, event )
					local Image1Frame3 = function ( Image1, event )
						if not event.interrupted then
							Image1:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
						end
						Image1:setLeftRight( true, false, -126.5, -106.5 )
						Image1:setTopBottom( true, false, 22.5, 38.5 )
						Image1:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image1, event )
						else
							Image1:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image1Frame3( Image1, event )
						return 
					else
						Image1:beginAnimation( "keyframe", 500, true, false, CoD.TweenType.Linear )
						Image1:setLeftRight( true, false, -126.5, -106.5 )
						Image1:setAlpha( 0 )
						Image1:registerEventHandler( "transition_complete_keyframe", Image1Frame3 )
					end
				end
				
				Image1:completeAnimation()
				self.Image1:setLeftRight( true, false, -15.5, 4.5 )
				self.Image1:setTopBottom( true, false, 22.5, 38.5 )
				self.Image1:setAlpha( 1 )
				Image1Frame2( Image1, {} )
				local Image0Frame2 = function ( Image0, event )
					local Image0Frame3 = function ( Image0, event )
						if not event.interrupted then
							Image0:beginAnimation( "keyframe", 1490, false, false, CoD.TweenType.Linear )
						end
						Image0:setLeftRight( true, false, 164.94, 184.94 )
						Image0:setTopBottom( true, false, 38.5, 22.5 )
						Image0:setAlpha( 0 )
						if event.interrupted then
							self.clipFinished( Image0, event )
						else
							Image0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						Image0Frame3( Image0, event )
						return 
					else
						Image0:beginAnimation( "keyframe", 500, true, false, CoD.TweenType.Linear )
						Image0:setLeftRight( true, false, 164.94, 184.94 )
						Image0:setAlpha( 0 )
						Image0:registerEventHandler( "transition_complete_keyframe", Image0Frame3 )
					end
				end
				
				Image0:completeAnimation()
				self.Image0:setLeftRight( true, false, 54.5, 74.5 )
				self.Image0:setTopBottom( true, false, 38.5, 22.5 )
				self.Image0:setAlpha( 1 )
				Image0Frame2( Image0, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

