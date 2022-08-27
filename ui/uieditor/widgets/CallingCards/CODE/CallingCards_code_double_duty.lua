-- 560673d5621feeaf0ebe3c6919736dde
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.CallingCards.CODE.CallingCards_code_double_duty_war" )
require( "ui.uieditor.widgets.CallingCards.CODE.CallingCards_code_double_duty_home" )

CoD.CallingCards_code_double_duty = InheritFrom( LUI.UIElement )
CoD.CallingCards_code_double_duty.new = function ( menu, controller )
	local self = LUI.UIElement.new()
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self:setUseStencil( true )
	self:setClass( CoD.CallingCards_code_double_duty )
	self.id = "CallingCards_code_double_duty"
	self.soundSet = "default"
	self:setLeftRight( true, false, 0, 480 )
	self:setTopBottom( true, false, 0, 120 )
	self.anyChildUsesUpdateState = true
	
	local white = LUI.UIImage.new()
	white:setLeftRight( true, false, -5.74, 485 )
	white:setTopBottom( true, false, -4, 124 )
	self:addElement( white )
	self.white = white
	
	local war = CoD.CallingCards_code_double_duty_war.new( menu, controller )
	war:setLeftRight( true, false, 0, 480 )
	war:setTopBottom( true, false, 0, 120 )
	self:addElement( war )
	self.war = war
	
	local home = CoD.CallingCards_code_double_duty_home.new( menu, controller )
	home:setLeftRight( true, false, 0, 480 )
	home:setTopBottom( true, false, 0, 120 )
	home:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
	home:setShaderVector( 0, 1, 1, 0, 0 )
	home:setShaderVector( 1, 0, 0, 0, 0 )
	home:setShaderVector( 2, 1, 1, 0, 0 )
	home:setShaderVector( 3, 0, 0, 0, 0 )
	self:addElement( home )
	self.home = home
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local f2_local0 = function ( f3_arg0, f3_arg1 )
					local f3_local0 = function ( f4_arg0, f4_arg1 )
						local f4_local0 = function ( f5_arg0, f5_arg1 )
							if not f5_arg1.interrupted then
								f5_arg0:beginAnimation( "keyframe", 3899, false, false, CoD.TweenType.Linear )
							end
							f5_arg0:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
							f5_arg0:setShaderVector( 0, 1, 1, 0, 0 )
							f5_arg0:setShaderVector( 1, 0, 0, 0, 0 )
							f5_arg0:setShaderVector( 2, 0, 1, 0, 0 )
							f5_arg0:setShaderVector( 3, 0, 0, 0, 0 )
							if f5_arg1.interrupted then
								self.clipFinished( f5_arg0, f5_arg1 )
							else
								f5_arg0:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if f4_arg1.interrupted then
							f4_local0( f4_arg0, f4_arg1 )
							return 
						else
							f4_arg0:beginAnimation( "keyframe", 3120, false, false, CoD.TweenType.Linear )
							f4_arg0:registerEventHandler( "transition_complete_keyframe", f4_local0 )
						end
					end
					
					if f3_arg1.interrupted then
						f3_local0( f3_arg0, f3_arg1 )
						return 
					else
						f3_arg0:beginAnimation( "keyframe", 3979, false, false, CoD.TweenType.Linear )
						f3_arg0:setShaderVector( 0, 0, 1, 0, 0 )
						f3_arg0:registerEventHandler( "transition_complete_keyframe", f3_local0 )
					end
				end
				
				home:beginAnimation( "keyframe", 3700, false, false, CoD.TweenType.Linear )
				self.home:setRFTMaterial( LUI.UIImage.GetCachedMaterial( "uie_wipe_delta_normal" ) )
				self.home:setShaderVector( 0, 0, 0, 0, 0 )
				self.home:setShaderVector( 1, 0, 0, 0, 0 )
				self.home:setShaderVector( 2, 0, 1, 0, 0 )
				self.home:setShaderVector( 3, 0, 0, 0, 0 )
				home:registerEventHandler( "transition_complete_keyframe", f2_local0 )
				self.nextClip = "DefaultClip"
			end
		}
	}
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.war:close()
		element.home:close()
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller, menu )
	end
	
	return self
end

