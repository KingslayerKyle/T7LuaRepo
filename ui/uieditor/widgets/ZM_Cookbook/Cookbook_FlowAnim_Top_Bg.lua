-- d27e2abcebd918440ea0e6f37327f04e
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.ZM_Cookbook.Cookbook_FlowAnim" )

CoD.Cookbook_FlowAnim_Top_Bg = InheritFrom( LUI.UIElement )
CoD.Cookbook_FlowAnim_Top_Bg.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( false )
	self:setClass( CoD.Cookbook_FlowAnim_Top_Bg )
	self.id = "Cookbook_FlowAnim_Top_Bg"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 96 )
	self:setTopBottom( true, false, 0, 153 )
	self.anyChildUsesUpdateState = true
	
	local Fill = LUI.UIImage.new()
	Fill:setLeftRight( true, false, 0, 96 )
	Fill:setTopBottom( true, false, 0, 153 )
	Fill:setImage( RegisterImage( "uie_t7_zm_cookbook_flow_fill" ) )
	Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
	Fill:setShaderVector( 0, 0.75, 0, 0, 0 )
	Fill:setShaderVector( 1, 1, 0, 0, 0 )
	Fill:setShaderVector( 2, 0, 0, 0, 0 )
	Fill:setShaderVector( 3, 0, 0, 0, 0 )
	Fill:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			Fill:setRGB( GetCookbookPipeColorForItemIndex( controller, itemIndex ) )
		end
	end )
	self:addElement( Fill )
	self.Fill = Fill
	
	local CookbookFlowAnim = CoD.Cookbook_FlowAnim.new( menu, controller )
	CookbookFlowAnim:setLeftRight( true, false, 0, 96 )
	CookbookFlowAnim:setTopBottom( true, false, 0, 153 )
	CookbookFlowAnim:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "ui_add" ) )
	CookbookFlowAnim:linkToElementModel( self, "itemIndex", true, function ( model )
		local itemIndex = Engine.GetModelValue( model )
		if itemIndex then
			CookbookFlowAnim:setRGB( GetCookbookPipeColorForItemIndex( controller, itemIndex ) )
		end
	end )
	self:addElement( CookbookFlowAnim )
	self.CookbookFlowAnim = CookbookFlowAnim
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.clipFinished( Fill, {} )
				CookbookFlowAnim:completeAnimation()
				CookbookFlowAnim.FlowTop:completeAnimation()
				self.CookbookFlowAnim.FlowTop:setAlpha( 0 )
				self.clipFinished( CookbookFlowAnim, {} )
			end
		},
		Visible = {
			DefaultClip = function ()
				self:setupElementClipCounter( 2 )
				Fill:completeAnimation()
				self.Fill:setAlpha( 0 )
				self.clipFinished( Fill, {} )
				CookbookFlowAnim:completeAnimation()
				CookbookFlowAnim.FlowTop:completeAnimation()
				self.CookbookFlowAnim.FlowTop:setAlpha( 0 )
				self.clipFinished( CookbookFlowAnim, {} )
			end,
			Animate = function ()
				self:setupElementClipCounter( 2 )
				local FillFrame2 = function ( Fill, event )
					local FillFrame3 = function ( Fill, event )
						local FillFrame4 = function ( Fill, event )
							if not event.interrupted then
								Fill:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
							end
							Fill:setAlpha( 1 )
							Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
							Fill:setShaderVector( 0, 0.5, 0.5, 0, 0 )
							Fill:setShaderVector( 1, 1, 0, 0, 0 )
							Fill:setShaderVector( 2, -0.16, 0, 0, 0 )
							Fill:setShaderVector( 3, 0, 0, 0, 0 )
							if event.interrupted then
								self.clipFinished( Fill, event )
							else
								Fill:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							FillFrame4( Fill, event )
							return 
						else
							Fill:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
							Fill:setShaderVector( 0, 0.75, 0.5, 0, 0 )
							Fill:registerEventHandler( "transition_complete_keyframe", FillFrame4 )
						end
					end
					
					if event.interrupted then
						FillFrame3( Fill, event )
						return 
					else
						Fill:beginAnimation( "keyframe", 1000, false, false, CoD.TweenType.Linear )
						Fill:setShaderVector( 0, 1, 0.5, 0, 0 )
						Fill:registerEventHandler( "transition_complete_keyframe", FillFrame3 )
					end
				end
				
				Fill:completeAnimation()
				self.Fill:setAlpha( 1 )
				self.Fill:setMaterial( LUI.UIImage.GetCachedMaterial( "uie_clock_normal" ) )
				self.Fill:setShaderVector( 0, 1, 0.72, 0, 0 )
				self.Fill:setShaderVector( 1, 1, 0, 0, 0 )
				self.Fill:setShaderVector( 2, -0.16, 0, 0, 0 )
				self.Fill:setShaderVector( 3, 0, 0, 0, 0 )
				FillFrame2( Fill, {} )
				local CookbookFlowAnimFrame2 = function ( CookbookFlowAnim, event )
					local CookbookFlowAnimFrame3 = function ( CookbookFlowAnim, event )
						local CookbookFlowAnimFrame4 = function ( CookbookFlowAnim, event )
							local CookbookFlowAnimFrame5 = function ( CookbookFlowAnim, event )
								if not event.interrupted then
									CookbookFlowAnim:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
									CookbookFlowAnim.FlowTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
								end
								CookbookFlowAnim.FlowTop:setAlpha( 0 )
								if event.interrupted then
									self.clipFinished( CookbookFlowAnim, event )
								else
									CookbookFlowAnim:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
								end
							end
							
							if event.interrupted then
								CookbookFlowAnimFrame5( CookbookFlowAnim, event )
								return 
							else
								CookbookFlowAnim:beginAnimation( "keyframe", 200, false, false, CoD.TweenType.Linear )
								CookbookFlowAnim:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimFrame5 )
							end
						end
						
						if event.interrupted then
							CookbookFlowAnimFrame4( CookbookFlowAnim, event )
							return 
						else
							CookbookFlowAnim:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
							CookbookFlowAnim.FlowTop:beginAnimation( "subkeyframe", 500, false, false, CoD.TweenType.Linear )
							CookbookFlowAnim.FlowTop:setAlpha( 1 )
							CookbookFlowAnim:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimFrame4 )
						end
					end
					
					if event.interrupted then
						CookbookFlowAnimFrame3( CookbookFlowAnim, event )
						return 
					else
						CookbookFlowAnim:beginAnimation( "keyframe", 500, false, false, CoD.TweenType.Linear )
						CookbookFlowAnim:registerEventHandler( "transition_complete_keyframe", CookbookFlowAnimFrame3 )
					end
				end
				
				CookbookFlowAnim:completeAnimation()
				CookbookFlowAnim.FlowTop:completeAnimation()
				self.CookbookFlowAnim.FlowTop:setAlpha( 0 )
				CookbookFlowAnimFrame2( CookbookFlowAnim, {} )
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
		element.CookbookFlowAnim:close()
		element.Fill:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

