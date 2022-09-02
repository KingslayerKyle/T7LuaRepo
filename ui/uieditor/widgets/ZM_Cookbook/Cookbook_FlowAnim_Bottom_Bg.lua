-- 7a4478358ba0a355a72cad45c7c705ee
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_FlowAnim_Bottom" )

CoD.Cookbook_FlowAnim_Bottom_Bg = InheritFrom( LUI.UIElement )
CoD.Cookbook_FlowAnim_Bottom_Bg.new = function ( menu, controller )
	local self = LUI.UIElement.new()

	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end

	self:setUseStencil( false )
	self:setClass( CoD.Cookbook_FlowAnim_Bottom_Bg )
	self.id = "Cookbook_FlowAnim_Bottom_Bg"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 153 )
	self.anyChildUsesUpdateState = true
	
	local FillBottom = LUI.UIImage.new()
	FillBottom:setLeftRight( true, false, 0, 96 )
	FillBottom:setTopBottom( true, false, 0, 153 )
	FillBottom:setXRot( 180 )
	FillBottom:setImage( RegisterImage( "uie_t7_zm_cookbook_flow_fill" ) )
	FillBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	FillBottom:setShaderVector( 0, 1, 0, 0, 0 )
	FillBottom:setShaderVector( 1, 1, 0, 0, 0 )
	FillBottom:setShaderVector( 2, 0, 0, 0, 0 )
	FillBottom:setShaderVector( 3, 0, 0, 0, 0 )
	FillBottom:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			FillBottom:setRGB( GetCookbookPipeColorForItemIndex( controller, itemIndex ) )
		end
	end )
	self:addElement( FillBottom )
	self.FillBottom = FillBottom
	
	local CookbookFlowAnimBottom = CoD.Cookbook_FlowAnim_Bottom.new( menu, controller )
	CookbookFlowAnimBottom:setLeftRight( true, true, 0, -0.35 )
	CookbookFlowAnimBottom:setTopBottom( true, true, 0.01, 0 )
	CookbookFlowAnimBottom:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CookbookFlowAnimBottom:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			CookbookFlowAnimBottom:setRGB( GetCookbookPipeColorForItemIndex( controller, itemIndex ) )
		end
	end )
	self:addElement( CookbookFlowAnimBottom )
	self.CookbookFlowAnimBottom = CookbookFlowAnimBottom
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FillBottom:completeAnimation()
				self.FillBottom:setAlpha( 0 )
				self.clipFinished( FillBottom, {} )

				CookbookFlowAnimBottom:completeAnimation()
				self.CookbookFlowAnimBottom:setAlpha( 0 )
				self.clipFinished( CookbookFlowAnimBottom, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )

				FillBottom:completeAnimation()
				self.FillBottom:setAlpha( 0 )
				self.clipFinished( FillBottom, {} )

				CookbookFlowAnimBottom:completeAnimation()

				CookbookFlowAnimBottom.FlowTop:completeAnimation()
				self.CookbookFlowAnimBottom:setAlpha( 1 )
				self.CookbookFlowAnimBottom.FlowTop:setAlpha( 0 )
				self.clipFinished( CookbookFlowAnimBottom, {} )
			end,
			Animate = function ()
				self:setupElementClipCounter( 2 )

				local FillBottomFrame2 = function ( FillBottom, event )
					local FillBottomFrame3 = function ( FillBottom, event )
						local FillBottomFrame4 = function ( FillBottom, event )
							if not event.interrupted then
								FillBottom:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							FillBottom:setAlpha( 1 )
							FillBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
							FillBottom:setShaderVector( 0, 0.5, 0.5, 0, 0 )
							FillBottom:setShaderVector( 1, 1, 0, 0, 0 )
							FillBottom:setShaderVector( 2, 0, 0, 0, 0 )
							FillBottom:setShaderVector( 3, 0, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( FillBottom, event )
							else
								FillBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FillBottomFrame4( FillBottom, event )
							return 
						else
							FillBottom:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							FillBottom:setShaderVector( 0, 0.75, 0.5, 0, 0 )
							FillBottom:registerEventHandler( "transition_complete_keyframe", FillBottomFrame4 )
						end
					end
					
					if event.interrupted then
						FillBottomFrame3( FillBottom, event )
						return 
					else
						FillBottom:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						FillBottom:setShaderVector( 0, 1, 0.5, 0, 0 )
						FillBottom:registerEventHandler( "transition_complete_keyframe", FillBottomFrame3 )
					end
				end
				
				FillBottom:completeAnimation()
				self.FillBottom:setAlpha( 1 )
				self.FillBottom:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
				self.FillBottom:setShaderVector( 0, 1, 0.75, 0, 0 )
				self.FillBottom:setShaderVector( 1, 1, 0, 0, 0 )
				self.FillBottom:setShaderVector( 2, 0, 0, 0, 0 )
				self.FillBottom:setShaderVector( 3, 0, 0, 0, 0 )
				FillBottomFrame2( FillBottom, {} )
				local CookbookFlowAnimBottomFrame2 = function ( CookbookFlowAnimBottom, event )
					local CookbookFlowAnimBottomFrame3 = function ( CookbookFlowAnimBottom, event )
						local CookbookFlowAnimBottomFrame4 = function ( CookbookFlowAnimBottom, event )
							local CookbookFlowAnimBottomFrame5 = function ( CookbookFlowAnimBottom, event )
								if not event.interrupted then
									CookbookFlowAnimBottom:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									CookbookFlowAnimBottom.FlowTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
								end
								CookbookFlowAnimBottom:setAlpha( 1 )
								CookbookFlowAnimBottom.FlowTop:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CookbookFlowAnimBottom, event )
								else
									CookbookFlowAnimBottom:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CookbookFlowAnimBottomFrame5( CookbookFlowAnimBottom, event )
								return 
							else
								CookbookFlowAnimBottom:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								CookbookFlowAnimBottom:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimBottomFrame5 )
							end
						end
						
						if event.interrupted then
							CookbookFlowAnimBottomFrame4( CookbookFlowAnimBottom, event )
							return 
						else
							CookbookFlowAnimBottom:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							CookbookFlowAnimBottom.FlowTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
							CookbookFlowAnimBottom.FlowTop:setAlpha( 1 )
							CookbookFlowAnimBottom:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimBottomFrame4 )
						end
					end
					
					if event.interrupted then
						CookbookFlowAnimBottomFrame3( CookbookFlowAnimBottom, event )
						return 
					else
						CookbookFlowAnimBottom:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						CookbookFlowAnimBottom:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimBottomFrame3 )
					end
				end
				
				CookbookFlowAnimBottom:completeAnimation()

				CookbookFlowAnimBottom.FlowTop:completeAnimation()
				self.CookbookFlowAnimBottom:setAlpha( 1 )
				self.CookbookFlowAnimBottom.FlowTop:setAlpha( 0 )
				CookbookFlowAnimBottomFrame2( CookbookFlowAnimBottom, {} )
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
		element.CookbookFlowAnimBottom:close()
		element.FillBottom:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

