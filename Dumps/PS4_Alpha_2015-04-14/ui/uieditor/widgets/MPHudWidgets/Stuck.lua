CoD.Stuck = InheritFrom( LUI.UIElement )
CoD.Stuck.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Stuck )
	self.id = "Stuck"
	self.soundSet = "HUD"
	self:setLeftRight( true, false, 0, 64 )
	self:setTopBottom( true, false, 0, 64 )
	
	local stickyIcon = LUI.UIImage.new()
	stickyIcon:setLeftRight( false, false, -32, 32 )
	stickyIcon:setTopBottom( false, false, -32, 32 )
	stickyIcon:setRGB( 1, 1, 1 )
	stickyIcon:setAlpha( 0 )
	stickyIcon:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	stickyIcon:subscribeToGlobalModel( controller, "HUDItems", "stickyImage", function ( model )
		local modelValue = Engine.GetModelValue( model )
		if modelValue then
			stickyIcon:setImage( RegisterImage( modelValue ) )
		end
	end )
	self:addElement( stickyIcon )
	self.stickyIcon = stickyIcon
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				stickyIcon:completeAnimation()
				self.stickyIcon:setAlpha( 0 )
				self.clipFinished( stickyIcon, {} )
			end
		},
		Stuck = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local stickyIconFrame2 = function ( stickyIcon, event )
					local stickyIconFrame3 = function ( stickyIcon, event )
						if not event.interrupted then
							stickyIcon:beginAnimation( "keyframe", 150, false, false, CoD.TweenType.Linear )
						end
						stickyIcon:setAlpha( 1 )
						if event.interrupted then
							self.clipFinished( stickyIcon, event )
						else
							stickyIcon:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
						end
					end
					
					if event.interrupted then
						stickyIconFrame3( stickyIcon, event )
						return 
					else
						stickyIcon:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						stickyIcon:setAlpha( 0.7 )
						stickyIcon:registerEventHandler( "transition_complete_keyframe", stickyIconFrame3 )
					end
				end
				
				stickyIcon:completeAnimation()
				self.stickyIcon:setAlpha( 1 )
				stickyIconFrame2( stickyIcon, {} )
				self.nextClip = "DefaultClip"
			end
		}
	}
	self.close = function ( self )
		self.stickyIcon:close()
		CoD.Stuck.super.close( self )
	end
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

