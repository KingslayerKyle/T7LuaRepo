-- d4faafdd0a2285c19cd7554d40986763
-- This hash is used for caching, delete to decompile the file again

require( "ui.uieditor.widgets.LoadingAnimation.AnimationLoading2" )
require( "ui.uieditor.widgets.StartGameFlow.LoadingScreenTalkerWidgetCPZM" )

local PostLoadFunc = function ( f1_arg0, f1_arg1 )
	f1_arg0.disableBlur = true
end

LUI.createMenu.InitialBlack = function ( controller )
	local self = CoD.Menu.NewForUIEditor( "InitialBlack" )
	if PreLoadFunc then
		PreLoadFunc( self, controller )
	end
	self.soundSet = "none"
	self:setOwner( controller )
	self:setLeftRight( true, true, 0, 0 )
	self:setTopBottom( true, true, 0, 0 )
	self:playSound( "menu_open", controller )
	self.buttonModel = Engine.CreateModel( Engine.GetModelForController( controller ), "InitialBlack.buttonPrompts" )
	local f2_local1 = self
	self.anyChildUsesUpdateState = true
	
	local Fullscreen = LUI.UIImage.new()
	Fullscreen:setLeftRight( true, true, 0, 0 )
	Fullscreen:setTopBottom( true, true, 0, 0 )
	Fullscreen:setImage( RegisterImage( "uie_default_black_0" ) )
	self:addElement( Fullscreen )
	self.Fullscreen = Fullscreen
	
	local AnimationLoading20 = CoD.AnimationLoading2.new( f2_local1, controller )
	AnimationLoading20:setLeftRight( false, true, -192, -64 )
	AnimationLoading20:setTopBottom( false, true, -164, -36 )
	AnimationLoading20:setScale( 0.5 )
	self:addElement( AnimationLoading20 )
	self.AnimationLoading20 = AnimationLoading20
	
	local Team1PlayerList = LUI.UIList.new( f2_local1, controller, 5, 0, nil, false, false, 0, 0, false, false )
	Team1PlayerList:makeFocusable()
	Team1PlayerList:setLeftRight( false, false, -576, -386 )
	Team1PlayerList:setTopBottom( true, false, 36, 123 )
	Team1PlayerList:setDataSource( "LoadingScreenPlayerListTeam1" )
	Team1PlayerList:setWidgetType( CoD.LoadingScreenTalkerWidgetCPZM )
	Team1PlayerList:setVerticalCount( 4 )
	Team1PlayerList:setSpacing( 5 )
	self:addElement( Team1PlayerList )
	self.Team1PlayerList = Team1PlayerList
	
	self.clipsPerState = {
		DefaultState = {
			DefaultClip = function ()
				self:setupElementClipCounter( 1 )
				local AnimationLoading20Frame2 = function ( AnimationLoading20, event )
					local AnimationLoading20Frame3 = function ( AnimationLoading20, event )
						local AnimationLoading20Frame4 = function ( AnimationLoading20, event )
							if not event.interrupted then
								AnimationLoading20:beginAnimation( "keyframe", 1010, false, false, CoD.TweenType.Linear )
							end
							AnimationLoading20:setAlpha( 0 )
							AnimationLoading20:setScale( 0.5 )
							if event.interrupted then
								self.clipFinished( AnimationLoading20, event )
							else
								AnimationLoading20:registerEventHandler( "transition_complete_keyframe", self.clipFinished )
							end
						end
						
						if event.interrupted then
							AnimationLoading20Frame4( AnimationLoading20, event )
							return 
						else
							AnimationLoading20:beginAnimation( "keyframe", 18489, false, false, CoD.TweenType.Linear )
							AnimationLoading20:setScale( 0.5 )
							AnimationLoading20:registerEventHandler( "transition_complete_keyframe", AnimationLoading20Frame4 )
						end
					end
					
					if event.interrupted then
						AnimationLoading20Frame3( AnimationLoading20, event )
						return 
					else
						AnimationLoading20:beginAnimation( "keyframe", 10510, false, false, CoD.TweenType.Linear )
						AnimationLoading20:setAlpha( 1 )
						AnimationLoading20:setScale( 0.6 )
						AnimationLoading20:registerEventHandler( "transition_complete_keyframe", AnimationLoading20Frame3 )
					end
				end
				
				AnimationLoading20:completeAnimation()
				self.AnimationLoading20:setAlpha( 0 )
				self.AnimationLoading20:setScale( 0.5 )
				AnimationLoading20Frame2( AnimationLoading20, {} )
			end
		}
	}
	Team1PlayerList.id = "Team1PlayerList"
	self:processEvent( {
		name = "menu_loaded",
		controller = controller
	} )
	self:processEvent( {
		name = "update_state",
		menu = f2_local1
	} )
	LUI.OverrideFunction_CallOriginalSecond( self, "close", function ( element )
		element.AnimationLoading20:close()
		element.Team1PlayerList:close()
		Engine.UnsubscribeAndFreeModel( Engine.GetModel( Engine.GetModelForController( controller ), "InitialBlack.buttonPrompts" ) )
	end )
	
	if PostLoadFunc then
		PostLoadFunc( self, controller )
	end
	
	return self
end

