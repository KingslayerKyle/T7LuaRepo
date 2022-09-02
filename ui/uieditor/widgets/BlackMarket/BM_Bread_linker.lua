-- 5f0926c97e2dcc0d318b0ff696410374
-- This hash is used for caching, delete to decompile the file again

CoD.BM_Bread_linker = InheritFrom( LUI.UIElement )
CoD.BM_Bread_linker.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.BM_Bread_linker )
	self.id = "BM_Bread_linker"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 83 )
	self:setTopBottom( true, false, 0, 68 )
	
	local linker = LUI.UIImage.new()
	linker:setLeftRight( true, false, 0, 83 )
	linker:setTopBottom( true, false, 0, 68 )
	linker:setAlpha( 0.9 )
	linker:setImage( RegisterImage( "uie_t7_menu_frontend_blackmarket_breadcrumb_linker" ) )
	self:addElement( linker )
	self.linker = linker
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )

				local linkerFrame2 = function ( linker, event )
					if not event.interrupted then
						linker:beginAnimation( "keyframe", 70, false, false, CoD.TweenType.Linear )
					end
					linker:setAlpha( 0.95 )
					if event.interrupted then
						self.clipFinished( linker, event )
					else
						linker:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
					end
				end
				
				linker:completeAnimation()
				self.linker:setAlpha( 0.9 )
				linkerFrame2( linker, {} )

				self.nextClip = "DefaultClip"
			end
		}
	}
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

