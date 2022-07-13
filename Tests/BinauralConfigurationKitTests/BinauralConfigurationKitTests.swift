import XCTest
@testable import BinauralConfigurationKit

final class EnvironmentTests: XCTestCase {
    func testInitialRead() throws {
        let sut = BinauralConfigurationKitImpl(defaults: DefaultsMock())

        XCTAssertEqual(sut.getEnvironment(), .prod)
    }

    func testSaveThenRead() throws {
        var sut = BinauralConfigurationKitImpl(defaults: DefaultsMock())

        sut.setEnvironment(environment: .staging)

        XCTAssertEqual(sut.getEnvironment(), .staging)
    }

    func testSaveTwiceThenRead() throws {
        var sut = BinauralConfigurationKitImpl(defaults: DefaultsMock())

        sut.setEnvironment(environment: .staging)
        sut.setEnvironment(environment: .prod)

        XCTAssertEqual(sut.getEnvironment(), .prod)
    }
}

final class RemoteConfigsTests: XCTestCase {
    func testinitialRead() throws {
        let sut = BinauralConfigurationKitImpl(defaults: DefaultsMock())

        XCTAssertEqual(sut.getRemoteConfigs(), [])
    }

    func testSetThenRead() throws {
        var sut = BinauralConfigurationKitImpl(defaults: DefaultsMock())
        let remoteConfigs: [RemoteConfig] = [.boolRemoteConfig(name: "RC1", value: true)]

        sut.setRemoteConfigs(remoteConfigs: remoteConfigs)

        XCTAssertEqual(sut.getRemoteConfigs(), remoteConfigs)
    }

    func testSetUpdateThenRead() throws {
        var sut = BinauralConfigurationKitImpl(defaults: DefaultsMock())
        let remoteConfigs: [RemoteConfig] = [.boolRemoteConfig(name: "RC1", value: true)]
        let remoteConfigsUpdated: [RemoteConfig] = [.boolRemoteConfig(name: "RC1", override: false, value: true)]


        sut.setRemoteConfigs(remoteConfigs: remoteConfigs)
        sut.updateRemoteConfigs(remoteConfigs: remoteConfigsUpdated)

        XCTAssertEqual(sut.getRemoteConfigs(), remoteConfigsUpdated)
    }

    func testSetUpdateSetThenRead() throws {
        var sut = BinauralConfigurationKitImpl(defaults: DefaultsMock())
        let remoteConfigs: [RemoteConfig] = [.boolRemoteConfig(name: "RC1", value: true)]
        let remoteConfigsUpdated: [RemoteConfig] = [.boolRemoteConfig(name: "RC1", override: false, value: true)]


        sut.setRemoteConfigs(remoteConfigs: remoteConfigs)
        sut.updateRemoteConfigs(remoteConfigs: remoteConfigsUpdated)
        sut.setRemoteConfigs(remoteConfigs: remoteConfigs)

        XCTAssertEqual(sut.getRemoteConfigs(), remoteConfigsUpdated)
    }
}
