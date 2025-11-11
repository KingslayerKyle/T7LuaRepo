CoD.CybercoreNodeLinkWidget = InheritFrom( LUI.UIElement )
CoD.CybercoreNodeLinkWidget.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.CybercoreNodeLinkWidget )
	self.id = "CybercoreNodeLinkWidget"
	self.soundSet = "CAC_LethalGrenade"
	self:setLeftRight( 0, 0, 0, 36 )
	self:setTopBottom( 0, 0, 0, 54 )
	
	local ActiveImage = LUI.UIImage.new()
	ActiveImage:setLeftRight( 0.5, 0.5, 18, -18 )
	ActiveImage:setTopBottom( 0, 1, 54, -54 )
	ActiveImage:setAlpha( 0 )
	ActiveImage:setImage( RegisterImage( "uie_t7_link_cybercore_tree" ) )
	self:addElement( ActiveImage )
	self.ActiveImage = ActiveImage
	
	local InactiveImage = LUI.UIImage.new()
	InactiveImage:setLeftRight( 0.5, 0.5, -18, 18 )
	InactiveImage:setTopBottom( 0, 1, 54, -54 )
	InactiveImage:setAlpha( 0 )
	InactiveImage:setImage( RegisterImage( "uie_t7_link_cybercore_tree" ) )
	self:addElement( InactiveImage )
	self.InactiveImage = InactiveImage
	
	self.resetProperties = function ()
		ActiveImage:completeAnimation()
		InactiveImage:completeAnimation()
		ActiveImage:setRGB( 1, 1, 1 )
		ActiveImage:setAlpha( 0 )
		ActiveImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
		InactiveImage:setAlpha( 0 )
		InactiveImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
	end
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ActiveImage:completeAnimation()
				self.ActiveImage:setAlpha( 1 )
				self.clipFinished( ActiveImage, {} )
			end
		},
		Inactive = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 2 )
				ActiveImage:completeAnimation()
				self.ActiveImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( ActiveImage, {} )
				InactiveImage:completeAnimation()
				self.InactiveImage:setAlpha( 0.25 )
				self.InactiveImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				self.clipFinished( InactiveImage, {} )
			end,
			Inactive = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				local InactiveImageFrame2 = function ( InactiveImage, event )
					local InactiveImageFrame3 = function ( InactiveImage, event )
						local InactiveImageFrame4 = function ( InactiveImage, event )
							local InactiveImageFrame5 = function ( InactiveImage, event )
								local InactiveImageFrame6 = function ( InactiveImage, event )
									local InactiveImageFrame7 = function ( InactiveImage, event )
										local InactiveImageFrame8 = function ( InactiveImage, event )
											if not event.interrupted then
												InactiveImage:beginAnimation( "keyframe", 109, false, false, CoD.TweenType.Linear )
											end
											InactiveImage:setAlpha( 1 )
											InactiveImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
											if event.interrupted then
												self.clipFinished( InactiveImage, event )
											else
												InactiveImage:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
											end
										end
										
										if event.interrupted then
											InactiveImageFrame8( InactiveImage, event )
											return 
										else
											InactiveImage:beginAnimation( "keyframe", 20, false, false, CoD.TweenType.Linear )
											InactiveImage:setAlpha( 1 )
											InactiveImage:registerEventHandler( "transition_complete_keyframe", InactiveImageFrame8 )
										end
									end
									
									if event.interrupted then
										InactiveImageFrame7( InactiveImage, event )
										return 
									else
										InactiveImage:beginAnimation( "keyframe", 10, false, false, CoD.TweenType.Linear )
										InactiveImage:setAlpha( 0.26 )
										InactiveImage:registerEventHandler( "transition_complete_keyframe", InactiveImageFrame7 )
									end
								end
								
								if event.interrupted then
									InactiveImageFrame6( InactiveImage, event )
									return 
								else
									InactiveImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
									InactiveImage:setAlpha( 1 )
									InactiveImage:registerEventHandler( "transition_complete_keyframe", InactiveImageFrame6 )
								end
							end
							
							if event.interrupted then
								InactiveImageFrame5( InactiveImage, event )
								return 
							else
								InactiveImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								InactiveImage:setAlpha( 0.01 )
								InactiveImage:registerEventHandler( "transition_complete_keyframe", InactiveImageFrame5 )
							end
						end
						
						if event.interrupted then
							InactiveImageFrame4( InactiveImage, event )
							return 
						else
							InactiveImage:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							InactiveImage:setAlpha( 1 )
							InactiveImage:registerEventHandler( "transition_complete_keyframe", InactiveImageFrame4 )
						end
					end
					
					if event.interrupted then
						InactiveImageFrame3( InactiveImage, event )
						return 
					else
						InactiveImage:beginAnimation( "keyframe", 19, false, false, CoD.TweenType.Linear )
						InactiveImage:setAlpha( 0.37 )
						InactiveImage:registerEventHandler( "transition_complete_keyframe", InactiveImageFrame3 )
					end
				end
				
				InactiveImage:completeAnimation()
				self.InactiveImage:setAlpha( 0 )
				self.InactiveImage:setMaterial( LUI.UIImage.GetCachedMaterial( "ui_normal" ) )
				InactiveImageFrame2( InactiveImage, {} )
			end,
			Active = function ()
				self.resetProperties()
				self:setupElementClipCounter( 0 )
			end
		},
		ActiveMartial = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ActiveImage:completeAnimation()
				self.ActiveImage:setRGB( 0.33, 0.76, 0.1 )
				self.ActiveImage:setAlpha( 1 )
				self.clipFinished( ActiveImage, {} )
			end
		},
		ActiveChaos = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ActiveImage:completeAnimation()
				self.ActiveImage:setRGB( 0.96, 0.36, 0.07 )
				self.ActiveImage:setAlpha( 1 )
				self.clipFinished( ActiveImage, {} )
			end
		},
		ActiveControl = {
			DefaultClip = function ()
				self.resetProperties()
				self:setupElementClipCounter( 1 )
				ActiveImage:completeAnimation()
				self.ActiveImage:setRGB( 0.07, 0.78, 0.96 )
				self.ActiveImage:setAlpha( 1 )
				self.clipFinished( ActiveImage, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Inactive",
			condition = function ( menu, element, event )
				return not IsSelfModelValueTrue( element, controller, "purchased" )
			end
		},
		{
			stateName = "ActiveMartial",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "core", "cybercore_martial" )
			end
		},
		{
			stateName = "ActiveChaos",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "core", "cybercore_chaos" )
			end
		},
		{
			stateName = "ActiveControl",
			condition = function ( menu, element, event )
				return IsSelfModelValueEqualTo( element, controller, "core", "cybercore_control" )
			end
		}
	} )
	self:linkToElementModel( self, "purchased", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "purchased"
		} )
	end )
	self:linkToElementModel( self, "core", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "core"
		} )
	end )
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	return self
end

