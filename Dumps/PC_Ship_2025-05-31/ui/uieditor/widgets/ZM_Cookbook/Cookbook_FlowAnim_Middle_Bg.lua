require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_FlowAnim_Middle" )

CoD.Cookbook_FlowAnim_Middle_Bg = InheritFrom( LUI.UIElement )
CoD.Cookbook_FlowAnim_Middle_Bg.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Cookbook_FlowAnim_Middle_Bg )
	self.id = "Cookbook_FlowAnim_Middle_Bg"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 75 )
	self:setTopBottom( true, false, 0, 102 )
	self.anyChildUsesUpdateState = true
	
	local FlatFill = LUI.UIImage.new()
	FlatFill:setLeftRight( true, false, 0, 74.56 )
	FlatFill:setTopBottom( true, false, 71.47, 81.47 )
	FlatFill:setImage( RegisterImage( "uie_t7_zm_cookbook_flow_fill_flat" ) )
	FlatFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	FlatFill:setShaderVector( 0, 1, 0, 0, 0 )
	FlatFill:setShaderVector( 1, 0, 0, 0, 0 )
	FlatFill:setShaderVector( 2, 1, 0, 0, 0 )
	FlatFill:setShaderVector( 3, 0, 0, 0, 0 )
	FlatFill:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			FlatFill:setRGB( GetCookbookPipeColorForItemIndex( controller, itemIndex ) )
		end
	end )
	self:addElement( FlatFill )
	self.FlatFill = FlatFill
	
	local FlatDrain = LUI.UIImage.new()
	FlatDrain:setLeftRight( true, false, 0, 74.56 )
	FlatDrain:setTopBottom( true, false, 71.47, 81.47 )
	FlatDrain:setZRot( 180 )
	FlatDrain:setImage( RegisterImage( "uie_t7_zm_cookbook_flow_fill_flat" ) )
	FlatDrain:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
	FlatDrain:setShaderVector( 0, 1, 0, 0, 0 )
	FlatDrain:setShaderVector( 1, 0, 0, 0, 0 )
	FlatDrain:setShaderVector( 2, 1, 0, 0, 0 )
	FlatDrain:setShaderVector( 3, 0, 0, 0, 0 )
	FlatDrain:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			FlatDrain:setRGB( GetCookbookPipeColorForItemIndex( controller, itemIndex ) )
		end
	end )
	self:addElement( FlatDrain )
	self.FlatDrain = FlatDrain
	
	local CookbookFlowAnimMiddle = CoD.Cookbook_FlowAnim_Middle.new( menu, controller )
	CookbookFlowAnimMiddle:setLeftRight( true, true, 0, 0 )
	CookbookFlowAnimMiddle:setTopBottom( true, true, 0, 0 )
	CookbookFlowAnimMiddle:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CookbookFlowAnimMiddle:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			CookbookFlowAnimMiddle:setRGB( GetCookbookPipeColorForItemIndex( controller, itemIndex ) )
		end
	end )
	self:addElement( CookbookFlowAnimMiddle )
	self.CookbookFlowAnimMiddle = CookbookFlowAnimMiddle
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				FlatFill:completeAnimation()
				self.FlatFill:setAlpha( 0 )
				self.clipFinished( FlatFill, {} )
				FlatDrain:completeAnimation()
				self.FlatDrain:setAlpha( 0 )
				self.clipFinished( FlatDrain, {} )
				CookbookFlowAnimMiddle:completeAnimation()
				self.CookbookFlowAnimMiddle:setAlpha( 0 )
				self.clipFinished( CookbookFlowAnimMiddle, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 3 )
				FlatFill:completeAnimation()
				self.FlatFill:setAlpha( 0 )
				self.clipFinished( FlatFill, {} )
				FlatDrain:completeAnimation()
				self.FlatDrain:setAlpha( 0 )
				self.clipFinished( FlatDrain, {} )
				CookbookFlowAnimMiddle:completeAnimation()
				CookbookFlowAnimMiddle.FlowTop:completeAnimation()
				self.CookbookFlowAnimMiddle:setAlpha( 1 )
				self.CookbookFlowAnimMiddle.FlowTop:setAlpha( 0 )
				self.clipFinished( CookbookFlowAnimMiddle, {} )
			end,
			Animate = function ()
				self:setupElementClipCounter( 3 )
				local FlatFillFrame2 = function ( FlatFill, event )
					local FlatFillFrame3 = function ( FlatFill, event )
						local FlatFillFrame4 = function ( FlatFill, event )
							local FlatFillFrame5 = function ( FlatFill, event )
								if not event.interrupted then
									FlatFill:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
								end
								FlatFill:setAlpha( 0 )
								FlatFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
								FlatFill:setShaderVector( 0, 0, 0, 0, 0 )
								FlatFill:setShaderVector( 1, 0, 0, 0, 0 )
								FlatFill:setShaderVector( 2, 1, 0, 0, 0 )
								FlatFill:setShaderVector( 3, 0, 0, 0, 0 )
								if event.interrupted then
									self.clipFinished( FlatFill, event )
								else
									FlatFill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								FlatFillFrame5( FlatFill, event )
								return 
							else
								FlatFill:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
								FlatFill:setAlpha( 0 )
								FlatFill:registerEventHandler( "transition_complete_keyframe", FlatFillFrame5 )
							end
						end
						
						if event.interrupted then
							FlatFillFrame4( FlatFill, event )
							return 
						else
							FlatFill:beginAnimation( "keyframe", 190, false, false, CoD.TweenType.Linear )
							FlatFill:registerEventHandler( "transition_complete_keyframe", FlatFillFrame4 )
						end
					end
					
					if event.interrupted then
						FlatFillFrame3( FlatFill, event )
						return 
					else
						FlatFill:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						FlatFill:setShaderVector( 0, 1, 0, 0, 0 )
						FlatFill:registerEventHandler( "transition_complete_keyframe", FlatFillFrame3 )
					end
				end
				
				FlatFill:completeAnimation()
				self.FlatFill:setAlpha( 1 )
				self.FlatFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
				self.FlatFill:setShaderVector( 0, 0, 0, 0, 0 )
				self.FlatFill:setShaderVector( 1, 0, 0, 0, 0 )
				self.FlatFill:setShaderVector( 2, 1, 0, 0, 0 )
				self.FlatFill:setShaderVector( 3, 0, 0, 0, 0 )
				FlatFillFrame2( FlatFill, {} )
				local FlatDrainFrame2 = function ( FlatDrain, event )
					local FlatDrainFrame3 = function ( FlatDrain, event )
						local FlatDrainFrame4 = function ( FlatDrain, event )
							if not event.interrupted then
								FlatDrain:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							FlatDrain:setAlpha( 1 )
							FlatDrain:setZRot( 180 )
							FlatDrain:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
							FlatDrain:setShaderVector( 0, 0, 0, 0, 0 )
							FlatDrain:setShaderVector( 1, 0, 0, 0, 0 )
							FlatDrain:setShaderVector( 2, 1, 0, 0, 0 )
							FlatDrain:setShaderVector( 3, 0, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( FlatDrain, event )
							else
								FlatDrain:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FlatDrainFrame4( FlatDrain, event )
							return 
						else
							FlatDrain:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							FlatDrain:setAlpha( 1 )
							FlatDrain:registerEventHandler( "transition_complete_keyframe", FlatDrainFrame4 )
						end
					end
					
					if event.interrupted then
						FlatDrainFrame3( FlatDrain, event )
						return 
					else
						FlatDrain:beginAnimation( "keyframe", 1190, false, false, CoD.TweenType.Linear )
						FlatDrain:registerEventHandler( "transition_complete_keyframe", FlatDrainFrame3 )
					end
				end
				
				FlatDrain:completeAnimation()
				self.FlatDrain:setAlpha( 0 )
				self.FlatDrain:setZRot( 180 )
				self.FlatDrain:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
				self.FlatDrain:setShaderVector( 0, 1, 0, 0, 0 )
				self.FlatDrain:setShaderVector( 1, 0, 0, 0, 0 )
				self.FlatDrain:setShaderVector( 2, 1, 0, 0, 0 )
				self.FlatDrain:setShaderVector( 3, 0, 0, 0, 0 )
				FlatDrainFrame2( FlatDrain, {} )
				local CookbookFlowAnimMiddleFrame2 = function ( CookbookFlowAnimMiddle, event )
					local CookbookFlowAnimMiddleFrame3 = function ( CookbookFlowAnimMiddle, event )
						local CookbookFlowAnimMiddleFrame4 = function ( CookbookFlowAnimMiddle, event )
							local CookbookFlowAnimMiddleFrame5 = function ( CookbookFlowAnimMiddle, event )
								if not event.interrupted then
									CookbookFlowAnimMiddle:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									CookbookFlowAnimMiddle.FlowTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
								end
								CookbookFlowAnimMiddle:setAlpha( 1 )
								CookbookFlowAnimMiddle.FlowTop:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CookbookFlowAnimMiddle, event )
								else
									CookbookFlowAnimMiddle:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CookbookFlowAnimMiddleFrame5( CookbookFlowAnimMiddle, event )
								return 
							else
								CookbookFlowAnimMiddle:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								CookbookFlowAnimMiddle:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimMiddleFrame5 )
							end
						end
						
						if event.interrupted then
							CookbookFlowAnimMiddleFrame4( CookbookFlowAnimMiddle, event )
							return 
						else
							CookbookFlowAnimMiddle:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							CookbookFlowAnimMiddle.FlowTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
							CookbookFlowAnimMiddle.FlowTop:setAlpha( 1 )
							CookbookFlowAnimMiddle:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimMiddleFrame4 )
						end
					end
					
					if event.interrupted then
						CookbookFlowAnimMiddleFrame3( CookbookFlowAnimMiddle, event )
						return 
					else
						CookbookFlowAnimMiddle:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						CookbookFlowAnimMiddle:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimMiddleFrame3 )
					end
				end
				
				CookbookFlowAnimMiddle:completeAnimation()
				CookbookFlowAnimMiddle.FlowTop:completeAnimation()
				self.CookbookFlowAnimMiddle:setAlpha( 1 )
				self.CookbookFlowAnimMiddle.FlowTop:setAlpha( 0 )
				CookbookFlowAnimMiddleFrame2( CookbookFlowAnimMiddle, {} )
			end
		}
	}
	self:mergeStateConditions( {
		{
			stateName = "Visible",
			condition = function ( menu, element, event )
				return not IsSelfModelValueNil( element, controller, "itemIndex" )
			end
		}
	} )
	self:linkToElementModel( self, "itemIndex", true, function ( model )
		menu:updateElementState( self, {
			name = "model_validation",
			menu = menu,
			modelValue = Engine.GetModelValue( model ),
			modelName = "itemIndex"
		} )
	end )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.CookbookFlowAnimMiddle:close()
		element.FlatFill:close()
		element.FlatDrain:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

