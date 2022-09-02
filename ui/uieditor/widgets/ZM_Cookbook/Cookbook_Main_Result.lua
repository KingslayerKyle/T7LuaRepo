-- a339a8e3f1f7b4ee9047cbf9b5d8dfce
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_FlowAnim_MiddleLarge" )

CoD.Cookbook_Main_Result = InheritFrom( LUI.UIElement )
CoD.Cookbook_Main_Result.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Cookbook_Main_Result )
	self.id = "Cookbook_Main_Result"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 90 )
	self:setTopBottom( true, false, 0, 153 )
	self.anyChildUsesUpdateState = true
	
	local FlatFill = LUI.UIImage.new()
	FlatFill:setLeftRight( true, false, 0, 90 )
	FlatFill:setTopBottom( true, false, 69.5, 87.5 )
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
	FlatDrain:setLeftRight( true, false, 0, 90 )
	FlatDrain:setTopBottom( true, false, 69.5, 87.5 )
	FlatDrain:setAlpha( 0 )
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
	
	local CookbookFlowAnimMiddleLarge = CoD.Cookbook_FlowAnim_MiddleLarge.new( menu, controller )
	CookbookFlowAnimMiddleLarge:setLeftRight( true, false, 0, 90 )
	CookbookFlowAnimMiddleLarge:setTopBottom( true, false, 0, 153 )
	CookbookFlowAnimMiddleLarge:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CookbookFlowAnimMiddleLarge:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			CookbookFlowAnimMiddleLarge:setRGB( GetCookbookPipeColorForItemIndex( controller, itemIndex ) )
		end
	end )
	self:addElement( CookbookFlowAnimMiddleLarge )
	self.CookbookFlowAnimMiddleLarge = CookbookFlowAnimMiddleLarge
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FlatFill:completeAnimation()
				self.FlatFill:setAlpha( 0 )
				self.clipFinished( FlatFill, {} )

				CookbookFlowAnimMiddleLarge:completeAnimation()

				CookbookFlowAnimMiddleLarge.FlowTop:completeAnimation()
				self.CookbookFlowAnimMiddleLarge.FlowTop:setAlpha( 0 )
				self.clipFinished( CookbookFlowAnimMiddleLarge, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FlatFill:completeAnimation()
				self.FlatFill:setAlpha( 0 )
				self.clipFinished( FlatFill, {} )

				CookbookFlowAnimMiddleLarge:completeAnimation()

				CookbookFlowAnimMiddleLarge.FlowTop:completeAnimation()
				self.CookbookFlowAnimMiddleLarge.FlowTop:setAlpha( 0 )
				self.clipFinished( CookbookFlowAnimMiddleLarge, {} )
			end,
			Animate = function ()
				self:setupElementClipCounter( 3 )

				local FlatFillFrame2 = function ( FlatFill, event )
					local FlatFillFrame3 = function ( FlatFill, event )
						local FlatFillFrame4 = function ( FlatFill, event )
							if not event.interrupted then
								FlatFill:beginAnimation( "keyframe", 9, false, false, CoD.TweenType.Linear )
							end
							FlatFill:setAlpha( 0 )
							FlatFill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
							FlatFill:setShaderVector( 0, 1, 0, 0, 0 )
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
							FlatFillFrame4( FlatFill, event )
							return 
						else
							FlatFill:beginAnimation( "keyframe", 490, false, false, CoD.TweenType.Linear )
							FlatFill:registerEventHandler( "transition_complete_keyframe", FlatFillFrame4 )
						end
					end
					
					if event.interrupted then
						FlatFillFrame3( FlatFill, event )
						return 
					else
						FlatFill:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
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
								FlatDrain:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							end
							FlatDrain:setAlpha( 1 )
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
						FlatDrain:beginAnimation( "keyframe", 990, false, false, CoD.TweenType.Linear )
						FlatDrain:registerEventHandler( "transition_complete_keyframe", FlatDrainFrame3 )
					end
				end
				
				FlatDrain:completeAnimation()
				self.FlatDrain:setAlpha( 0 )
				self.FlatDrain:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_normal" ) )
				self.FlatDrain:setShaderVector( 0, 1, 0, 0, 0 )
				self.FlatDrain:setShaderVector( 1, 0, 0, 0, 0 )
				self.FlatDrain:setShaderVector( 2, 1, 0, 0, 0 )
				self.FlatDrain:setShaderVector( 3, 0, 0, 0, 0 )
				FlatDrainFrame2( FlatDrain, {} )
				local CookbookFlowAnimMiddleLargeFrame2 = function ( CookbookFlowAnimMiddleLarge, event )
					local CookbookFlowAnimMiddleLargeFrame3 = function ( CookbookFlowAnimMiddleLarge, event )
						local CookbookFlowAnimMiddleLargeFrame4 = function ( CookbookFlowAnimMiddleLarge, event )
							local CookbookFlowAnimMiddleLargeFrame5 = function ( CookbookFlowAnimMiddleLarge, event )
								if not event.interrupted then
									CookbookFlowAnimMiddleLarge:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									CookbookFlowAnimMiddleLarge.FlowTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
								end
								CookbookFlowAnimMiddleLarge.FlowTop:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CookbookFlowAnimMiddleLarge, event )
								else
									CookbookFlowAnimMiddleLarge:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CookbookFlowAnimMiddleLargeFrame5( CookbookFlowAnimMiddleLarge, event )
								return 
							else
								CookbookFlowAnimMiddleLarge:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
								CookbookFlowAnimMiddleLarge:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimMiddleLargeFrame5 )
							end
						end
						
						if event.interrupted then
							CookbookFlowAnimMiddleLargeFrame4( CookbookFlowAnimMiddleLarge, event )
							return 
						else
							CookbookFlowAnimMiddleLarge:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
							CookbookFlowAnimMiddleLarge.FlowTop:beginAnimation( "subkeyframe", 250, false, false, CoD.TweenType.Linear )
							CookbookFlowAnimMiddleLarge.FlowTop:setAlpha( 1 )
							CookbookFlowAnimMiddleLarge:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimMiddleLargeFrame4 )
						end
					end
					
					if event.interrupted then
						CookbookFlowAnimMiddleLargeFrame3( CookbookFlowAnimMiddleLarge, event )
						return 
					else
						CookbookFlowAnimMiddleLarge:beginAnimation( "keyframe", 250, false, false, CoD.TweenType.Linear )
						CookbookFlowAnimMiddleLarge:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimMiddleLargeFrame3 )
					end
				end
				
				CookbookFlowAnimMiddleLarge:completeAnimation()

				CookbookFlowAnimMiddleLarge.FlowTop:completeAnimation()
				self.CookbookFlowAnimMiddleLarge.FlowTop:setAlpha( 0 )
				CookbookFlowAnimMiddleLargeFrame2( CookbookFlowAnimMiddleLarge, {} )
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
		element.CookbookFlowAnimMiddleLarge:close()
		element.FlatFill:close()
		element.FlatDrain:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

